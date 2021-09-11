part of 'create_quiz_bloc.dart';

@immutable
abstract class CreateQuizState {}

class CreateQuizInitial extends CreateQuizState {}

class CreateQuizCreated extends CreateQuizState {}

class CreateQuizAdding extends CreateQuizState {}

class CreateQuizFailed extends CreateQuizState {}

class CreateQuizSelectCorrectOption extends CreateQuizState {}

class CreateQuizEmptyField extends CreateQuizState {}
