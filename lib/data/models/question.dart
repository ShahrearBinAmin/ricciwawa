import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:ricciwawa/data/models/user.dart';

class Question {
  String questionId;
  String questionText;
  String correctOptionId;
  String correctOptionName;
  String? selectedOptionName;
  String explanation;
  int position;
  bool shuffleOption;
  int createTime;
  List<Option> options;
  bool isDefault;

  Question(
      {required this.questionId,
      required this.questionText,
      required this.correctOptionId,
      required this.correctOptionName,
      required this.explanation,
      required this.position,
      required this.shuffleOption,
      required this.options,
      this.isDefault = false,
      this.selectedOptionName})
      : createTime = DateTime.now().microsecondsSinceEpoch;

  void addOption(Option option) {
    this.options.add(option);
  }

  void deleteOption(String optionName) {
    this.options.removeWhere((element) => element.optionName == optionName);
  }

  Question copyWith(
      {String? questionId,
      String? questionText,
      String? correctOptionId,
      String? correctOptionName,
      String? explanation,
      int? position,
      bool? shuffleOption,
      List<Option>? options,
      bool? isDefault}) {
    return Question(
        questionId: questionId ?? this.questionId,
        questionText: questionText ?? this.questionText,
        correctOptionId: correctOptionId ?? this.correctOptionId,
        correctOptionName: correctOptionName ?? this.correctOptionName,
        explanation: explanation ?? this.explanation,
        position: position ?? this.position,
        shuffleOption: shuffleOption ?? this.shuffleOption,
        options: options ?? this.options.map((e) => e.copyWith()).toList(),
        isDefault: isDefault ?? this.isDefault);
  }

  @override
  String toString() {
    return 'Question(questionId: $questionId, questionText: $questionText, correctOptionId: $correctOptionId, correctOptionName: $correctOptionName, explanation: $explanation, position: $position, shuffleOption: $shuffleOption, options: $options)';
  }

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'questionText': questionText,
      'correctOptionId': correctOptionId,
      'correctOptionName': correctOptionName,
      'selectedOptionName': selectedOptionName,
      'explanation': explanation,
      'position': position,
      'shuffleOption': shuffleOption,
      'createTime': createTime,
      'options': options.map((x) => x.toMap()).toList(),
      'isDefault': isDefault,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionId: map['questionId'],
      questionText: map['questionText'],
      correctOptionId: map['correctOptionId'],
      correctOptionName: map['correctOptionName'],
      selectedOptionName: map['selectedOptionName'],
      explanation: map['explanation'],
      position: map['position'],
      shuffleOption: map['shuffleOption'],
      options: List<Option>.from(map['options'].map((x) => Option.fromMap(x))),
      isDefault: map['isDefault'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Question.fromJson(String source) =>
      Question.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Question &&
        other.questionId == questionId &&
        other.questionText == questionText &&
        other.correctOptionId == correctOptionId &&
        other.correctOptionName == correctOptionName &&
        other.selectedOptionName == selectedOptionName &&
        other.explanation == explanation &&
        other.position == position &&
        other.shuffleOption == shuffleOption &&
        other.createTime == createTime &&
        listEquals(other.options, options) &&
        other.isDefault == isDefault;
  }

  @override
  int get hashCode {
    return questionId.hashCode ^
        questionText.hashCode ^
        correctOptionId.hashCode ^
        correctOptionName.hashCode ^
        selectedOptionName.hashCode ^
        explanation.hashCode ^
        position.hashCode ^
        shuffleOption.hashCode ^
        createTime.hashCode ^
        options.hashCode ^
        isDefault.hashCode;
  }
}

class OptionStat {
  final List<User> answeredUsers;
  final double percentage;
  final int answeredUsersCount;
  int createTime;

  OptionStat({
    this.answeredUsers = const <User>[],
    this.percentage = 0,
    this.answeredUsersCount = 0,
  }) : createTime = DateTime.now().microsecondsSinceEpoch;

  OptionStat copyWith({
    List<User>? answeredUsers,
    double? percentage,
    int? answeredUsersCount,
  }) {
    return OptionStat(
      answeredUsers: answeredUsers ?? this.answeredUsers,
      percentage: percentage ?? this.percentage,
      answeredUsersCount: answeredUsersCount ?? this.answeredUsersCount,
    );
  }

  @override
  String toString() {
    return 'OptionStat(answeredUsers: $answeredUsers, percentage: $percentage, answeredUsersCount: $answeredUsersCount, createTime: $createTime)';
  }

  Map<String, dynamic> toMap() {
    return {
      'answeredUsers': answeredUsers?.map((x) => x.toMap())?.toList(),
      'percentage': percentage,
      'answeredUsersCount': answeredUsersCount,
      'createTime': createTime,
    };
  }

  factory OptionStat.fromMap(Map<String, dynamic> map) {
    return OptionStat(
      answeredUsers:
          List<User>.from(map['answeredUsers']?.map((x) => User.fromMap(x))),
      percentage: map['percentage'],
      answeredUsersCount: map['answeredUsersCount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionStat.fromJson(String source) =>
      OptionStat.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is OptionStat &&
        listEquals(other.answeredUsers, answeredUsers) &&
        other.percentage == percentage &&
        other.answeredUsersCount == answeredUsersCount &&
        other.createTime == createTime;
  }

  @override
  int get hashCode {
    return answeredUsers.hashCode ^
        percentage.hashCode ^
        answeredUsersCount.hashCode ^
        createTime.hashCode;
  }
}

class Option {
  String optionId;
  String optionName;
  String optionText;
  OptionStat optionStat;
  Option(
      {required this.optionId,
      required this.optionName,
      required this.optionText,
      required this.optionStat});

  Option copyWith(
      {String? optionId,
      String? optionName,
      String? optionText,
      OptionStat? optionStat}) {
    return Option(
      optionId: optionId ?? this.optionId,
      optionName: optionName ?? this.optionName,
      optionText: optionText ?? this.optionText,
      optionStat: optionStat ?? this.optionStat.copyWith(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'optionId': optionId,
      'optionName': optionName,
      'optionText': optionText,
      'optionStat': optionStat.toMap()
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
        optionId: map['optionId'],
        optionName: map['optionName'],
        optionText: map['optionText'],
        optionStat: OptionStat.fromMap(map['optionStat']));
  }

  String toJson() => json.encode(toMap());

  factory Option.fromJson(String source) => Option.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Option &&
        other.optionId == optionId &&
        other.optionName == optionName &&
        other.optionText == optionText;
  }

  @override
  int get hashCode =>
      optionId.hashCode ^ optionName.hashCode ^ optionText.hashCode;

  @override
  String toString() =>
      'Option(optionId: $optionId, optionName: $optionName, optionText: $optionText)';
}
