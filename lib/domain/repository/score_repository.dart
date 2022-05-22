import '../common/result.dart';
import '../model/score_model.dart';

abstract class ScoreRepository {
  Future<Result<List<ScoreModel>>> getScores();
  Future<Result<void>> saveScore(String name, int score, int timeInSeconds);
}
