import 'package:ricciwawa/data/models/question.dart';
import 'dart:convert';
import 'package:collection/collection.dart';

class Quiz {
  String quizId;
  String postId;
  String creatorId;
  List<Question> questions;

  Quiz({
    required this.quizId,
    required this.postId,
    required this.creatorId,
    required this.questions,
  });

  void addQuestion(Question question) {
    questions.add(question);
  }

  Quiz copyWith({
    String? quizId,
    String? postId,
    String? creatorId,
    List<Question>? questions,
  }) {
    return Quiz(
      quizId: quizId ?? this.quizId,
      postId: postId ?? this.postId,
      creatorId: creatorId ?? this.creatorId,
      questions: questions ?? this.questions.map((e) => e.copyWith()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'quizId': quizId,
      'postId': postId,
      'creatorId': creatorId,
      'questions': questions?.map((x) => x.toMap())?.toList(),
    };
  }

  List<Map<String, dynamic>> toMapQuestions() {
    return questions.map((x) => x.toMap()).toList();
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      quizId: map['quizId'],
      postId: map['postId'],
      creatorId: map['creatorId'],
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
    );
  }

  factory Quiz.fromMapRaw(Map<String, dynamic> map) {
    return Quiz(
      quizId: map['public_code'],
      postId: map['public_code'],
      creatorId: map['fuid'],
      questions: List<Question>.from(
          map['questions']?.map((x) => Question.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());
  String toJsonQuestions() => json.encode(toMapQuestions());

  factory Quiz.fromJson(String source) => Quiz.fromMap(json.decode(source));
  factory Quiz.fromJsonRaw(String source) =>
      Quiz.fromMapRaw(json.decode(source));

  @override
  String toString() {
    return 'Quiz(quizId: $quizId, postId: $postId, creatorId: $creatorId, questions: $questions)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Quiz &&
        other.quizId == quizId &&
        other.postId == postId &&
        other.creatorId == creatorId &&
        listEquals(other.questions, questions);
  }

  @override
  int get hashCode {
    return quizId.hashCode ^
        postId.hashCode ^
        creatorId.hashCode ^
        questions.hashCode;
  }
}
