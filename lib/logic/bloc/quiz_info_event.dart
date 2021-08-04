part of 'quiz_info_bloc.dart';

@immutable
abstract class QuizInfoEvent {}

class GetQuizInfo extends QuizInfoEvent {
  final String quizId;
  GetQuizInfo(this.quizId);
}

class GetQuizStat extends QuizInfoEvent {
  final String quizId;
  GetQuizStat(this.quizId);
}

class GetCurrentIndex extends QuizInfoEvent {
  final int index;
  GetCurrentIndex(this.index);
}

class NextQuiz extends QuizInfoEvent {}
