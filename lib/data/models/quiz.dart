import 'package:ricciwawa/data/models/question.dart';

class Quiz {
  final String quizId;
  final String postId;
  final String creatorId;
  final List<Question> questions;

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
