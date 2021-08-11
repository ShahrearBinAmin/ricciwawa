import 'package:ricciwawa/data/models/user.dart';

class Question {
  String questionId;
  String questionText;
  String correctOptionId;
  String correctOptionName;
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
      this.isDefault = false})
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
      answeredUsers:
          answeredUsers ?? this.answeredUsers.map((e) => e.copyWith()).toList(),
      percentage: percentage ?? this.percentage,
      answeredUsersCount: answeredUsersCount ?? this.answeredUsersCount,
    );
  }

  @override
  String toString() =>
      'OptionStat(answeredUsers: $answeredUsers, percentage: $percentage, answeredUsersCount: $answeredUsersCount)';
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
      optionStat: optionStat ?? this.optionStat,
    );
  }

  @override
  String toString() =>
      'Option(optionId: $optionId, optionName: $optionName, optionText: $optionText)';
}
