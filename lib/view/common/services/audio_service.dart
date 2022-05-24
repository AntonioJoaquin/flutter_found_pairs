// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:collection';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart' hide Logger;
import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';

import '../../../core/common/custom_notifiers.dart';
import '../style/audio.dart';

/// Allows playing music and sound. A facade to `package:audioplayers`.
class AudioService {
  static final _log = Logger('AudioController');

  late AudioCache _musicCache;

  late AudioCache _sfxCache;

  final AudioPlayer _musicPlayer;

  /// This is a list of [AudioPlayer] instances which are rotated to play
  /// sound effects.
  ///
  /// Normally, we would just call [AudioCache.play] and let it procure its
  /// own [AudioPlayer] every time. But this seems to lead to errors and
  /// bad performance on iOS devices.
  final List<AudioPlayer> _sfxPlayers;

  int _currentSfxPlayer = 0;

  final Queue<String> _playlist;

  final Random _random = Random();

  CustomValueNotifier<AppLifecycleState>? _lifecycleNotifier;

  /// Creates an instance that plays music and sound.
  ///
  /// Use [polyphony] to configure the number of sound effects (SFX) that can
  /// play at the same time. A [polyphony] of `1` will always only play one
  /// sound (a new sound will stop the previous one). See discussion
  /// of [_sfxPlayers] to learn why this is the case.
  ///
  /// Background music does not count into the [polyphony] limit. Music will
  /// never be overridden by sound effects.
  AudioService({int polyphony = 2})
      : assert(polyphony >= 1),
        _musicPlayer = AudioPlayer(playerId: 'musicPlayer'),
        _sfxPlayers = Iterable.generate(
            polyphony,
            (i) => AudioPlayer(
                playerId: 'sfxPlayer#$i',
                mode: PlayerMode.LOW_LATENCY)).toList(growable: false),
        _playlist = Queue.of([Audio.homeMusic]) {
    _musicCache = AudioCache(
      fixedPlayer: _musicPlayer,
      prefix: 'assets/sounds/music/',
    );
    _sfxCache = AudioCache(
      fixedPlayer: _sfxPlayers.first,
      prefix: 'assets/sounds/',
    );

    _musicPlayer.onPlayerCompletion.listen(_changeSong);
  }

  /// Enables the [AudioController] to listen to [AppLifecycleState] events,
  /// and therefore do things like stopping playback when the game
  /// goes into the background.
  void attachLifecycleNotifier(
      CustomValueNotifier<AppLifecycleState> lifecycleNotifier) {
    _lifecycleNotifier?.removeListener(_handleAppLifecycle);

    lifecycleNotifier.addListener(_handleAppLifecycle);
    _lifecycleNotifier = lifecycleNotifier;
  }

  void dispose() {
    _lifecycleNotifier?.removeListener(_handleAppLifecycle);
    _stopAllSound();
    _musicPlayer.dispose();
    for (final player in _sfxPlayers) {
      player.dispose();
    }
  }

  /// Preloads all sound effects.
  Future<void> initialize() async {
    _log.info('Preloading sound effects');
    // This assumes there is only a limited number of sound effects in the game.
    // If there are hundreds of long sound effect files, it's better
    // to be more selective when preloading.
    await _sfxCache.loadAll([Audio.loseSound, Audio.winSound]);
  }

  /// Plays a single sound effect, defined by [type].
  ///
  /// The controller will ignore this call when the attached settings'
  /// [SettingsController.muted] is `true` or if its
  /// [SettingsController.soundsOn] is `false`.
  /// TODO: Add muted option management
  void playSfx(String sfx) {
    _log.info(() => 'Playing sound: $sfx');
    _sfxCache.play(sfx);
    _currentSfxPlayer = (_currentSfxPlayer + 1) % _sfxPlayers.length;
    _sfxCache.fixedPlayer = _sfxPlayers[_currentSfxPlayer];
  }

  void _changeSong(void _) {
    _log.info('Last song finished playing.');
    // Put the song that just finished playing to the end of the playlist.
    _playlist.addLast(_playlist.removeFirst());
    // Play the next song.
    _log.info(() => 'Playing ${_playlist.first} now.');
    _musicCache.play(_playlist.first);
  }

  void _handleAppLifecycle() {
    switch (_lifecycleNotifier!.value) {
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        _stopAllSound();

        break;
      case AppLifecycleState.resumed:
        // TODO: Manage muted or musicOn settings
        _resumeMusic();

        break;
      case AppLifecycleState.inactive:
        // No need to react to this state change.
        break;
    }
  }

  Future<void> _resumeMusic() async {
    _log.info('Resuming music');
    switch (_musicPlayer.state) {
      case PlayerState.PAUSED:
        _log.info('Calling _musicPlayer.resume()');
        try {
          await _musicPlayer.resume();
        } catch (e) {
          // Sometimes, resuming fails with an "Unexpected" error.
          _log.severe(e);
          await _musicCache.play(_playlist.first);
        }
        break;
      case PlayerState.STOPPED:
        _log.info("resumeMusic() called when music is stopped. "
            "This probably means we haven't yet started the music. "
            "For example, the game was started with sound off.");
        await _musicCache.play(_playlist.first);
        break;
      case PlayerState.PLAYING:
        _log.warning('resumeMusic() called when music is playing. '
            'Nothing to do.');
        break;
      case PlayerState.COMPLETED:
        _log.warning('resumeMusic() called when music is completed. '
            "Music should never be 'completed' as it's either not playing "
            "or looping forever.");
        await _musicCache.play(_playlist.first);
        break;
    }
  }

  void startMusic() {
    _log.info('starting music');
    _musicCache.play(_playlist.first);
  }

  void _stopAllSound() {
    if (_musicPlayer.state == PlayerState.PLAYING) {
      _musicPlayer.pause();
    }
    for (final player in _sfxPlayers) {
      player.stop();
    }
  }

  void stopMusic() {
    _log.info('Stopping music');
    if (_musicPlayer.state == PlayerState.PLAYING) {
      _musicPlayer.pause();
    }
  }
}
