import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ricciwawa/constants.dart';
import 'package:ricciwawa/data/models/answer_quiz.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/logic/bloc/quiz_info_bloc.dart';
import 'package:ricciwawa/screens/quiz_result/quiz_result.dart';

import 'components/answer_explanation.dart';
import 'components/custom_outlined_button.dart';
import 'components/custom_text_button.dart';
import 'components/progress_bar.dart';
import 'components/question_card.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  double _currentPercentage = 0;
  int _totalPage = 0;
  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);
  late Quiz _quiz;
  Status questionStatus = Status.CHECK_DISABLED;
  Set<String> correctAnswers = {};
  Set<String> wrongAnswers = {};
  String _optionName = "";
  String _questionId = "";

  @override
  void initState() {
    context.read<QuizInfoBloc>().add(GetQuizStat("1"));

    super.initState();
  }

  void onNext() {
    if (this._currentIndex + 1 == this._totalPage) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => QuizResult(
                answerInfo: AnswerInfo(
                    percentage:
                        ((correctAnswers.length / _quiz.questions.length) * 100)
                            .round(),
                    correct: correctAnswers.length,
                    wrong: wrongAnswers.length),
              )));
      return;
    }

    setState(() {
      questionStatus = Status.CHECK_DISABLED;
    });
    _optionName = "";
    _questionId = "";

    this
        ._pageController
        .nextPage(duration: Duration(milliseconds: 700), curve: Curves.ease);
  }

  void onPrevious() {
    this._pageController.previousPage(
        duration: Duration(milliseconds: 700), curve: Curves.ease);
  }

  void onCheckEnabled() {
    Question question = _quiz.questions
        .firstWhere((element) => element.questionId == _questionId);
    if (question.correctOptionName == _optionName) {
      setState(() {
        questionStatus = Status.CORRECT;
      });

      correctAnswers.add(_questionId);
    } else {
      setState(() {
        questionStatus = Status.WRONG;
      });
      wrongAnswers.add(_questionId);
    }
  }

  void optionClicked(String optionName, String questionId) {
    setState(() {
      questionStatus = Status.CHECK_ENABLED;
    });
    _optionName = optionName;
    _questionId = questionId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      body: BlocConsumer<QuizInfoBloc, QuizInfoState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is QuizInfoLoaded) {
            _totalPage = state.quiz.questions.length;
            _quiz = state.quiz;
            return Container(
              decoration: BoxDecoration(color: kSecondaryColor),
              width: double.infinity,
              height: double.infinity,
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefaultPadding / 2),
                      child: ProgressBar(
                        percentage: this._currentPercentage == 0
                            ? (1 / state.quiz.questions.length)
                            : this._currentPercentage,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPadding / 2),
                        child: PageView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPercentage =
                                    (index + 1) / state.quiz.questions.length;
                                _currentIndex = index;
                              });
                            },
                            itemCount: state.quiz.questions.length,
                            itemBuilder: (context, index) => QuestionCard(
                                onOptionClick: optionClicked,
                                selectedOptionName: _optionName,
                                questionStatus: questionStatus,
                                question: state.quiz.questions[index])),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (questionStatus == Status.CHECK_DISABLED) ...[
                      BottomButtons(
                        onNext: () {},
                        onPrevious: onPrevious,
                        rightButtonText: "Check",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ] else if (questionStatus == Status.CHECK_ENABLED) ...[
                      BottomButtons(
                        onNext: onCheckEnabled,
                        onPrevious: onPrevious,
                        rightButtonText: "Check",
                        correctOrWrong: kGreenColor,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ] else if (questionStatus == Status.CORRECT) ...[
                      AnswerExplanation(
                        correctOrWrong: kGreenColor,
                        onNext: onNext,
                        onPrevious: onPrevious,
                        question: state.quiz.questions[_currentIndex],
                      ),
                    ] else if (questionStatus == Status.WRONG) ...[
                      AnswerExplanation(
                        correctOrWrong: kRedColor,
                        onNext: onNext,
                        onPrevious: onPrevious,
                        question: state.quiz.questions[_currentIndex],
                      ),
                    ],
                  ],
                ),
              )),
            );
          } else {
            return Container(
              height: 0,
              width: 0,
            );
          }
        },
      ),
    );
  }
}

class BottomButtons extends StatelessWidget {
  final Color? correctOrWrong;
  final Function onNext;
  final Function onPrevious;
  final String rightButtonText;
  final String leftButtonText;
  const BottomButtons({
    Key? key,
    this.correctOrWrong,
    this.rightButtonText = "Next",
    this.leftButtonText = "Previous",
    required this.onNext,
    required this.onPrevious,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomOutlinedButton(
          buttonText: leftButtonText,
          onClick: onPrevious,
        ),
        CustomTextButton(
          buttonText: rightButtonText,
          onClick: onNext,
          backgroundColor: correctOrWrong ?? kGrayBorderColor,
        ),
      ],
    );
  }
}
