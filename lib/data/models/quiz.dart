import 'package:ricciwawa/data/models/question.dart';

class Quiz {
  String quizId;
  String postId;
  String creatorId;
  List<Question> questions;

  Quiz({
    required this.quizId,
    required this.postId,
    required this.creatorId,
    required this.questions,
  });

  void addQuestion(Question question) {
    questions.add(question);
  }
}
