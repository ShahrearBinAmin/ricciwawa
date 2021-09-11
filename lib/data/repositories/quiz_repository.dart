import 'dart:ffi';

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

class QuizInfoRepository implements QuizRepository {
  @override
  Future<Quiz> fetchQuiz(String quizId) {
    // TODO: implement fetchQuiz
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
