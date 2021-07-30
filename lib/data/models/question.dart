class Question {
  final String questionId;
  final String questionText;
  final String correctOptionId;
  final String explanation;
  final int position;
  final bool shuffleOption;
  final List<Option> options;
  Question({
    required this.questionId,
    required this.questionText,
    required this.correctOptionId,
    required this.explanation,
    required this.position,
    required this.shuffleOption,
    required this.options,
  });

  void addOption(Option option) {
    options.add(option);
  }
}

class Option {
  final String optionId;
  final String optionText;
  final String optionName;
  Option({
    required this.optionId,
    required this.optionText,
  });
}
