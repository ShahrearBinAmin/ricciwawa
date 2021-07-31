import 'package:ricciwawa/data/models/user.dart';

class Question {
  String questionId;
  String questionText;
  String correctOptionId;
  String correctOptionName;
  String explanation;
  int position;
  bool shuffleOption;
  List<Option> options;

  Question({
    required this.questionId,
    required this.questionText,
    required this.correctOptionId,
    required this.correctOptionName,
    required this.explanation,
    required this.position,
    required this.shuffleOption,
    required this.options,
  });

  void addOption(Option option) {
    options.add(option);
  }
}

class OptionStat {
  final List<User> answeredUsers;
  final double percentage;
  final int answeredUsersCount;
  OptionStat({
    this.answeredUsers = const <User>[],
    this.percentage = 0,
    this.answeredUsersCount = 0,
  });
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
}
