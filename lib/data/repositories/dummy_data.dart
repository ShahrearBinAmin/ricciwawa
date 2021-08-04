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

Quiz quiz_with_stat =
    Quiz(quizId: "1", postId: "10", creatorId: "100", questions: [
  Question(
      questionId: "499",
      questionText: "李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰?",
      correctOptionId: "a",
      correctOptionName: "A",
      explanation:
          "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
      position: 1,
      shuffleOption: false,
      options: [
        Option(
            optionId: "a",
            optionText: "兒子",
            optionName: "A",
            optionStat: OptionStat(
                percentage: 0.0, answeredUsersCount: 0, answeredUsers: [])),
        Option(
            optionId: "b",
            optionText: "媽媽",
            optionName: "B",
            optionStat: OptionStat(
                percentage: 90,
                answeredUsersCount: 63,
                answeredUsers: [
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa")
                ])),
        Option(
            optionId: "c",
            optionText: "爸爸",
            optionName: "C",
            optionStat: OptionStat(
                percentage: 10,
                answeredUsersCount: 7,
                answeredUsers: [
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa")
                ])),
        Option(
            optionId: "d",
            optionText: "哥哥",
            optionName: "D",
            optionStat: OptionStat(
                percentage: 0.0, answeredUsersCount: 0, answeredUsers: [])),
      ]),
  Question(
      questionId: "500",
      questionText: "2 李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰?",
      correctOptionId: "a",
      correctOptionName: "A",
      explanation:
          "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
      position: 1,
      shuffleOption: false,
      options: [
        Option(
            optionId: "a",
            optionText: "兒子",
            optionName: "A",
            optionStat: OptionStat(
                percentage: 0.0, answeredUsersCount: 0, answeredUsers: [])),
        Option(
            optionId: "b",
            optionText: "媽媽",
            optionName: "B",
            optionStat: OptionStat(
                percentage: 90,
                answeredUsersCount: 63,
                answeredUsers: [
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa")
                ])),
        Option(
            optionId: "c",
            optionText: "爸爸",
            optionName: "C",
            optionStat: OptionStat(
                percentage: 10,
                answeredUsersCount: 7,
                answeredUsers: [
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa")
                ])),
        Option(
            optionId: "d",
            optionText: "哥哥",
            optionName: "D",
            optionStat: OptionStat(
                percentage: 0.0, answeredUsersCount: 0, answeredUsers: [])),
      ]),
  Question(
      questionId: "5001",
      questionText: "3 李明是李蛋的哥哥，劉云是李蛋的媽媽。李明是劉雲的誰?",
      correctOptionId: "a",
      correctOptionName: "A",
      explanation:
          "兒子 is correct because 李明 is 李蛋’s brother. If 李蛋’s mother is 劉雲 , then 李明 ‘s mother is 劉雲 too.",
      position: 1,
      shuffleOption: false,
      options: [
        Option(
            optionId: "a",
            optionText: "兒子",
            optionName: "A",
            optionStat: OptionStat(
                percentage: 0.0, answeredUsersCount: 0, answeredUsers: [])),
        Option(
            optionId: "b",
            optionText: "媽媽",
            optionName: "B",
            optionStat: OptionStat(
                percentage: 90,
                answeredUsersCount: 63,
                answeredUsers: [
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa")
                ])),
        Option(
            optionId: "c",
            optionText: "爸爸",
            optionName: "C",
            optionStat: OptionStat(
                percentage: 10,
                answeredUsersCount: 7,
                answeredUsers: [
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa"),
                  User(
                      userId: "1",
                      name: "@Sammid",
                      email: "test@email.com",
                      userPhoto: "aaaa")
                ])),
        Option(
            optionId: "d",
            optionText: "哥哥",
            optionName: "D",
            optionStat: OptionStat(
                percentage: 0.0, answeredUsersCount: 0, answeredUsers: [])),
      ])
]);
