part of 'quiz_info_bloc.dart';

@immutable
abstract class QuizInfoState {}

class QuizInfoInitial extends QuizInfoState {}

class QuizInfoLoading extends QuizInfoState {
  QuizInfoLoading();
}

class QuizInfoLoaded extends QuizInfoState {
  final Quiz quiz;

  QuizInfoLoaded(
    this.quiz,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizInfoLoaded && other.quiz == quiz;
  }

  @override
  int get hashCode => quiz.hashCode;
}
