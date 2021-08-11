import 'package:ricciwawa/data/models/question.dart';
import 'package:uuid/uuid.dart';

OptionStat generateOptionSate() {
  return OptionStat(
    percentage: 0.0,
    answeredUsers: [],
  );
}

Question generateQuestion(String id) {
  List<Option> options = List.generate(2, (index) {
    String optionId = Uuid().v4();
    return generateOption(optionId);
  });

  return Question(
      questionId: id,
      questionText: "",
      correctOptionId: "",
      correctOptionName: "",
      explanation: "",
      position: 0,
      shuffleOption: false,
      options: options);
}

Option generateOption(String name) {
  return Option(
      optionId: name,
      optionName: name,
      optionText: "",
      optionStat: generateOptionSate());
}
