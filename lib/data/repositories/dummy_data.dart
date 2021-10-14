import 'dart:math';

import 'package:ricciwawa/data/models/answer_quiz.dart';
import 'package:ricciwawa/data/models/post.dart';
import 'package:ricciwawa/data/models/question.dart';
import 'package:ricciwawa/data/models/quiz.dart';
import 'package:ricciwawa/data/models/user.dart';

// Quiz quiz_user = Quiz(quizId: "1", postId: "10", creatorId: "100", questions: [
//   Question(
//       questionId: "500",
//       questionText: "李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰?",
//       correctOptionId: "a",
//       correctOptionName: "A",
//       explanation:
//           "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
//       position: 1,
//       shuffleOption: false,
//       options: [
//         Option(optionId: "a", optionText: "兒子", optionName: "A"),
//         Option(optionId: "b", optionText: "媽媽", optionName: "B"),
//         Option(optionId: "c", optionText: "爸爸", optionName: "C"),
//         Option(optionId: "d", optionText: "哥哥", optionName: "D"),
//       ])
// ]);

String convertIntToChar(int index) {
  //int randomNumber = Random().nextInt(4);
  return String.fromCharCode(65 + index);
}

String getTextBasedOnIndex(int index) {
  var options = ["爸爸", "兒子", "媽媽", "弟弟", "弟弟弟弟"];
  return options[index];
}

Quiz quiz_with_stat =
    Quiz(quizId: "1", postId: "10", creatorId: "100", questions: [
  ...List.generate(
      4,
      (index) => Question(
          questionId: "$index",
          questionText: "李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰?",
          correctOptionId: "1",
          correctOptionName: "A",
          explanation:
              "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
          position: index,
          shuffleOption: true,
          selectedOptionName: "B",
          options: List.generate(
              4,
              (index) => Option(
                  optionId: "$index",
                  optionName: convertIntToChar(index),
                  optionPosition: index,
                  optionText: getTextBasedOnIndex(index),
                  optionStat: OptionStat(
                      percentage: 90,
                      answeredUsersCount: 63,
                      answeredUsers: [
                        ...List.generate(
                            4,
                            (index) => User(
                                userId: "$index",
                                name: "@Sammid",
                                email: "test@email.com",
                                userName: "aaaa")),
                      ]))))),
]);

List<UserAnswer> userAnswers = List.generate(
    10,
    (index) => UserAnswer(
        userAnswerId: "$index",
        quizId: "${index + 1}",
        examTimestamp: DateTime.now().millisecondsSinceEpoch,
        answerInfo: AnswerInfo(correct: 10, wrong: 2, percentage: 83),
        post: Post(
            creator: User(
                userId: "$index",
                name: "DanielCriag ${index + 1}",
                email: 'daniel${index + 1}@gmail.com',
                userName: "danieldriag${index + 1}"),
            postId: "${index + 1}",
            postTitle: "The Future of Labour",
            postDescription: "Desc The Future of Labour",
            postVideoUrl:
                "https://www.youtube.com/watch?v=AaIASk2u1C0&ab_channel=Flutter",
            postImages: <String>["https://imgur.com/uHZ3Mim"],
            postTags: ["politics"],
            postTimeStamp: DateTime.now().millisecondsSinceEpoch,
            postLoveCount: 10,
            postCommentCount: 8,
            postShareCount: 60,
            quiz: Quiz(
                quizId: "$index",
                creatorId: "$index",
                postId: "$index",
                questions: [
                  ...List.generate(
                      3,
                      (index) => Question(
                          questionId: "$index",
                          questionText: "李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰?",
                          correctOptionId: "1",
                          correctOptionName: "A",
                          explanation:
                              "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
                          position: index,
                          selectedOptionName: "B",
                          shuffleOption: true,
                          options: List.generate(
                              4,
                              (index) => Option(
                                  optionId: "$index",
                                  optionName: convertIntToChar(index),
                                  optionPosition: index,
                                  optionText: getTextBasedOnIndex(index),
                                  optionStat: OptionStat(
                                      percentage: 90,
                                      answeredUsersCount: 63,
                                      answeredUsers: [
                                        ...List.generate(
                                            4,
                                            (index) => User(
                                                userId: "$index",
                                                name: "@Sammid",
                                                email: "test@email.com",
                                                userName: "aaaa")),
                                      ]))))),
                ]))));
