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
      'question_id': questionId,
      'question_text': questionText,
      'correct_option_id': correctOptionId,
      'correct_option_name': correctOptionName,
      'selected_option_name': selectedOptionName,
      'correct_option_explanation': explanation,
      'position': position,
      'shuffle_option': shuffleOption,
      'create_time': createTime,
      'options': options.map((x) => x.toMap()).toList(),
      'is_default': isDefault,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      questionId: map['question_dd'],
      questionText: map['question_text'],
      correctOptionId: map['correct_option_id'],
      correctOptionName: map['correct_option_name'],
      selectedOptionName: map['selected_option_name'],
      explanation: map['correct_option_explanation'],
      position: map['position'],
      shuffleOption: map['shuffle_option'],
      options: List<Option>.from(map['options'].map((x) => Option.fromMap(x))),
      isDefault: map['is_default'],
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
      'answered_ssers': answeredUsers?.map((x) => x.toMap())?.toList(),
      'percentage': percentage,
      'answered_users_count': answeredUsersCount,
      'create_time': createTime,
    };
  }

  factory OptionStat.fromMap(Map<String, dynamic> map) {
    return OptionStat(
      answeredUsers:
          List<User>.from(map['answered_users']?.map((x) => User.fromMap(x))),
      percentage: map['percentage'],
      answeredUsersCount: map['answered_users_count'],
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
  int optionPosition;
  String optionText;
  OptionStat optionStat;
  Option(
      {required this.optionId,
      required this.optionName,
      required this.optionPosition,
      required this.optionText,
      required this.optionStat});

  Option copyWith(
      {String? optionId,
      String? optionName,
      int? optionPosition,
      String? optionText,
      OptionStat? optionStat}) {
    return Option(
      optionId: optionId ?? this.optionId,
      optionName: optionName ?? this.optionName,
      optionPosition: optionPosition ?? this.optionPosition,
      optionText: optionText ?? this.optionText,
      optionStat: optionStat ?? this.optionStat.copyWith(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'option_id': optionId,
      'option_name': optionName,
      'option_position': optionPosition,
      'option_text': optionText,
      'option_stat': optionStat.toMap()
    };
  }

  factory Option.fromMap(Map<String, dynamic> map) {
    return Option(
        optionId: map['option_id'],
        optionName: map['option_name'],
        optionPosition: map['option_position'],
        optionText: map['option_text'],
        optionStat: OptionStat.fromMap(map['option_stat']));
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
      'Option(optionId: $optionId, optionName: $optionName, optionText: $optionText, optionPosition: $optionPosition)';
}
