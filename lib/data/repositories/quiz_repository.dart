import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';

abstract class QuizRepository {
  /// Thows [Network Excpetion]
  Future<Quiz> fetchQuiz(String quizId);
}

Quiz quiz = Quiz(quizId: "1", postId: "10", creatorId: "100", questions: [
  Question(
      questionId: "500",
      questionText: "李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰?",
      correctOptionId: "a",
      explanation:
          "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
      position: 1,
      shuffleOption: false,
      options: [
        Option(optionId: "a", optionText: "兒子"),
        Option(optionId: "b", optionText: "媽媽"),
        Option(optionId: "c", optionText: "爸爸"),
        Option(optionId: "d", optionText: "哥哥"),
      ])
]);

class FakeQuizRepository implements QuizRepository {
  @override
  Future<Quiz> fetchQuiz(String quizId) {
    // TODO: implement fetchQuiz
    return Future.delayed(Duration(seconds: 1), () {
      return quiz;
    });
  }
}
