import '../../../../objectbox.g.dart';
import '../database/app_database.dart';
import '../entity/score.dart';

abstract class ScoreDao {
  static Future<void> storeScore(
    String name,
    int score,
    int timeInSeconds,
  ) async {
    final scoreBox = AppDatabase.appDatabase.store.box<Score>();
    final List<Score> scores =
        scoreBox.query(Score_.name.equals(name)).build().find();

    scores.isNotEmpty
        ? scoreBox.put(scores.first.setScore(score))
        : scoreBox.put(Score(name, score, timeInSeconds));
  }

  static Future<List<Score>> getScores() async {
    final scoreBox = AppDatabase.appDatabase.store.box<Score>();
    final QueryBuilder<Score> scores = scoreBox.query()
      ..order(
        Score_.score,
        flags: Order.descending,
      );

    return scores.build().find();
  }
}
