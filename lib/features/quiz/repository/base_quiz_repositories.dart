import 'package:flutter_danthocode/models/question/question_model.dart';
import '../../../enums/difficulty.dart';

abstract class BaseQuizRepositories {
  Future<List<Question>> getQuestions({
    int numQuestions,
    int categoryId,
    Difficulty difficulty,
  });
}
