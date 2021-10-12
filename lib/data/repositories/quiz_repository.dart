import 'dart:ffi';

import 'package:logger/logger.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/data/models/user.dart';
import 'package:ricciwawa/data/repositories/constants.dart';
import 'package:ricciwawa/data/repositories/dummy_data.dart';
import 'package:http/http.dart' as http;

abstract class QuizRepository {
  /// Thows [Network Excpetion]
  Future<Quiz> fetchQuiz(String quizId);
}

var logger = Logger(
  printer: PrettyPrinter(),
);

class QuizInfoRepository implements QuizRepository {
  @override
  Future<Quiz> fetchQuiz(String quizId) async {
    // TODO: implement fetchQuiz
    var url = Uri.parse(API_BASE_URL + "?flutter=quiz_fetch");
    var map = new Map<String, dynamic>();
    map['fuid'] = "66";
    map['public_code'] = "ff";
    var response = await http.post(url, body: map);
    logger.i('Response body: ${response.statusCode}');
    logger.i('Response body: ${response.body}');
    // return quiz_with_stat;
    // Quiz quiz = Quiz.fromJsonRaw(response.body);
    // logger.i(quiz);

    return Future.delayed(Duration(milliseconds: 300), () {
      return quiz_with_stat;
    });
  }

  Future<Quiz> fetchQuizWithStat(String quizId) {
    return Future.delayed(Duration(milliseconds: 300), () {
      return quiz_with_stat;
    });
  }

  Future<http.Response> postQuiz(Quiz quiz) async {
    var url = Uri.parse(API_BASE_URL + "?flutter=quiz_create");
    var map = new Map<String, dynamic>();
    map['fuid'] = quiz.creatorId;
    map['public_code'] = quiz.postId;
    map['questions'] = quiz.toJsonQuestions();
    var response = await http.post(url, body: map);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response;
  }
}
