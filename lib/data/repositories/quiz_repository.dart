import 'dart:io';
import 'dart:math';

import 'package:logger/logger.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/data/models/user.dart';
import 'package:ricciwawa/data/repositories/constants.dart';
import 'package:ricciwawa/data/repositories/dummy_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    quizId = 'a3971290-23d3-47cb-8c19-a436d298202b';

    var url = Uri.parse(API_BASE_URL + "/quiz/$quizId");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body);
    logger.i('Response body: ${response.statusCode}');
    logger.i('Response body: ${response.body}');
    // return quiz_with_stat;
    // Quiz quiz = Quiz.fromJsonRaw(response.body);
    // logger.i(quiz);
    logger.i(
        'Data type is ${responseBody.runtimeType} ${responseBody["data"].runtimeType}');

    Quiz quiz = Quiz.fromMap(responseBody['data']);
    logger.i("Converting to object : ${quiz}");

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
    var url = Uri.parse(API_BASE_URL + "/quiz/");
    logger.i("Sending data : ${quiz.toJson()}");
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: "application/json; charset=UTF-8",
        },
        body: quiz.toJson());
    logger.i('Response status: ${response.statusCode}');
    var responseBody = json.decode(response.body);
    if (responseBody['code'] <= 200) {
      logger.i('Quiz created : ${responseBody["data"]}');
    } else {
      throw Exception('Failed to create quiz.');
    }

    return response;
  }
}
