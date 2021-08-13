import 'package:ricciwawa/data/models/post.dart';

class AnswerInfo {
  int percentage;
  int correct;
  int wrong;
  AnswerInfo(
      {required this.percentage, required this.correct, required this.wrong});
}

class UserAnswer {
  String userAnswerId;
  String quizId;
  int examTimestamp;
  AnswerInfo answerInfo;
  Post post;
  UserAnswer({
    required this.userAnswerId,
    required this.quizId,
    required this.examTimestamp,
    required this.answerInfo,
    required this.post,
  });

  @override
  String toString() {
    return 'UserAnswer(userAnswerId: $userAnswerId, quizId: $quizId, examTimestamp: $examTimestamp, answerInfo: $answerInfo, post: $post)';
  }

  UserAnswer copyWith({
    String? userAnswerId,
    String? quizId,
    int? examTimestamp,
    AnswerInfo? answerInfo,
    Post? post,
  }) {
    return UserAnswer(
      userAnswerId: userAnswerId ?? this.userAnswerId,
      quizId: quizId ?? this.quizId,
      examTimestamp: examTimestamp ?? this.examTimestamp,
      answerInfo: answerInfo ?? this.answerInfo,
      post: post ?? this.post,
    );
  }
}
