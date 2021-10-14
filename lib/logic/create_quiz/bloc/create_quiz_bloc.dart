import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/data/repositories/quiz_repository.dart';

part 'create_quiz_event.dart';
part 'create_quiz_state.dart';

class CreateQuizBloc extends Bloc<CreateQuizEvent, CreateQuizState> {
  final QuizInfoRepository _quizInfoRepository;

  CreateQuizBloc(this._quizInfoRepository) : super(CreateQuizInitial());

  @override
  Stream<CreateQuizState> mapEventToState(
    CreateQuizEvent event,
  ) async* {
    if (event is PostCreateQuizEvent) {
      if (isAnyFieldEmpty(event.quiz)) {
        print("You can't keep any field empty");
        yield CreateQuizEmptyField();
      } else if (isAnyCorrectUnselected(event.quiz)) {
        print("You must select correct option for each question");
        yield CreateQuizSelectCorrectOption();
      } else {
        try {
          final response = await _quizInfoRepository
              .postQuiz(assignPosition(mapOptionIdToOptionName(event.quiz)));
          if (response.statusCode == 200) {
            yield CreateQuizCreated();
          } else {
            yield CreateQuizFailed();
          }
        } on Exception catch (_) {
          yield CreateQuizFailed();
        }
      }
    }
  }

  Quiz mapOptionIdToOptionName(Quiz quiz) {
    for (Question question in quiz.questions) {
      for (var i = 0; i < question.options.length; i++) {
        var char = String.fromCharCode(65 + i);
        question.options[i].optionName = char;
        if (question.options[i].optionId == question.correctOptionId) {
          question.correctOptionName = char;
        }
      }
    }
    return quiz;
  }

  Quiz assignPosition(Quiz quiz) {
    for (int i = 0; i < quiz.questions.length; i++) {
      var question = quiz.questions[i];
      question.position = i;
      for (int j = 0; j < question.options.length; j++) {
        var option = question.options[j];
        option.optionPosition = j;
      }
    }
    print("Quiz after assigning position : ${quiz}");
    return quiz;
  }

  bool isAnyCorrectUnselected(Quiz quiz) {
    return !quiz.questions
        .every((element) => element.correctOptionId.length != 0);
  }

  bool isAnyFieldEmpty(Quiz quiz) {
    for (Question question in quiz.questions) {
      if (question.questionText.length == 0) return true;
      for (Option option in question.options) {
        if (option.optionText.length == 0) return true;
      }
    }
    return false;
  }
}
