import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/data/repositories/quiz_repository.dart';

part 'quiz_info_event.dart';
part 'quiz_info_state.dart';

class QuizInfoBloc extends Bloc<QuizInfoEvent, QuizInfoState> {
  final QuizInfoRepository _quizInfoRepository;

  QuizInfoBloc(this._quizInfoRepository) : super(QuizInfoInitial());

  @override
  Stream<QuizInfoState> mapEventToState(
    QuizInfoEvent event,
  ) async* {
    if (event is GetQuizInfo) {
      yield QuizInfoLoading();
      final quizInfo = await _quizInfoRepository.fetchQuiz(event.quizId);
      yield QuizInfoLoaded(quiz: quizInfo, currentIndex: 0);
    } else if (event is GetQuizStat) {
      yield QuizInfoLoading();

      final quizInfoStat =
          await _quizInfoRepository.fetchQuizWithStat(event.quizId);
      yield QuizInfoLoaded(quiz: quizInfoStat, currentIndex: 0);
    } else if (event is GetCurrentIndex) {
      yield CurrentQuiz(index: event.index);
    }
  }
}
