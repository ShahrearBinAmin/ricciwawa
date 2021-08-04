part of 'quiz_info_bloc.dart';

@immutable
abstract class QuizInfoState {}

class QuizInfoInitial extends QuizInfoState {}

class QuizInfoLoading extends QuizInfoState {
  QuizInfoLoading();
}

class QuizInfoLoaded extends QuizInfoState {
  final Quiz quiz;
  final int currentIndex;

  QuizInfoLoaded({required this.quiz, required this.currentIndex});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizInfoLoaded && other.quiz == quiz;
  }

  @override
  int get hashCode => quiz.hashCode;
}

class CurrentQuiz extends QuizInfoState {
  final int index;
  CurrentQuiz({required this.index});
}

class NotAnsweredYet extends QuizInfoState {}

class CorrectAnswer extends QuizInfoState {}

class WrongAnswer extends QuizInfoState {}
