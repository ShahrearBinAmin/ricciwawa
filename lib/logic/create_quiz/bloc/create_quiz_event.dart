part of 'create_quiz_bloc.dart';

@immutable
abstract class CreateQuizEvent {}

class PostCreateQuizEvent extends CreateQuizEvent {
  final Quiz quiz;
  PostCreateQuizEvent(this.quiz);
}
