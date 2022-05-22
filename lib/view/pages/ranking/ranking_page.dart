import 'package:flutter/material.dart';

import '../../../core/common/status.dart';
import '../../../di/locator.dart';
import '../../../domain/model/score_model.dart';
import '../../common/widgets/custom_button.dart';
import 'ranking_manager.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final RankingManager _manager = locator<RankingManager>();

  @override
  void initState() {
    _manager.getRanking();

    super.initState();
  }

  @override
  void dispose() {
    _manager.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _manager.navigateToHome();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Content(manager: _manager),
              CustomButton(
                'Close',
                _manager.navigateToHome,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required RankingManager manager,
  })  : _manager = manager,
        super(key: key);

  final RankingManager _manager;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Status>(
      valueListenable: _manager.status,
      builder: (_, Status status, __) =>
          ValueListenableBuilder<List<ScoreModel>>(
        valueListenable: _manager.ranking,
        builder: (_, List<ScoreModel> ranking, __) => (status == Status.loading)
            ? const Center(child: CircularProgressIndicator())
            : _RankingList(ranking),
      ),
    );
  }
}

class _RankingList extends StatelessWidget {
  const _RankingList(
    List<ScoreModel> ranking, {
    Key? key,
  })  : _ranking = ranking,
        super(key: key);

  final List<ScoreModel> _ranking;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shrinkWrap: true,
      itemCount: _ranking.length,
      separatorBuilder: (_, __) => const Divider(color: Colors.amber),
      itemBuilder: (_, index) => _RankingItem(_ranking[index]),
    );
  }
}

class _RankingItem extends StatelessWidget {
  const _RankingItem(ScoreModel score, {Key? key})
      : _score = score,
        super(key: key);

  final ScoreModel _score;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _score.name,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        _score.score.toString(),
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
