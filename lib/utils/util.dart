import 'package:ricciwawa/data/models/question.dart';

OptionStat generateOptionSate() {
  return OptionStat(
    percentage: 0.0,
    answeredUsers: [],
  );
}

Question generateQuestion(int id) {
  return Question(
      questionId: "$id",
      questionText: "",
      correctOptionId: "",
      correctOptionName: "",
      explanation: "",
      position: 0,
      shuffleOption: false,
      options: [
        Option(
            optionId: "1",
            optionName: "1",
            optionText: "",
            optionStat: generateOptionSate()),
        Option(
            optionId: "2",
            optionName: "2",
            optionText: "",
            optionStat: generateOptionSate()),
      ]);
}

Option generateOption(String name) {
  return Option(
      optionId: name,
      optionName: name,
      optionText: "",
      optionStat: generateOptionSate());
}
