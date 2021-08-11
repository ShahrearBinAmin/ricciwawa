import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/data/models/user.dart';
import 'package:ricciwawa/data/repositories/dummy_data.dart';

abstract class QuizRepository {
  /// Thows [Network Excpetion]
  Future<Quiz> fetchQuiz(String quizId);
}

class QuizInfoRepository implements QuizRepository {
  @override
  Future<Quiz> fetchQuiz(String quizId) {
    // TODO: implement fetchQuiz
    return Future.delayed(Duration(milliseconds: 300), () {
      return quiz_with_stat;
    });
  }

  Future<Quiz> fetchQuizWithStat(String quizId) {
    return Future.delayed(Duration(milliseconds: 300), () {
      return quiz_with_stat;
    });
  }
}
