// import 'package:flutter/material.dart';
// import 'package:vidhan/content/principles/principles_quize/screens/quizprovider.dart';
//
// import 'package:vidhan/games/quize/models/questions.dart';
// import 'package:vidhan/games/quize/screens/result_screen.dart';
// import 'package:vidhan/games/quize/widgets/answer_card.dart';
// import 'package:vidhan/games/quize/widgets/next_button.dart';
//
// import '../../../../games/quize/models/question.dart';
// import 'package:vidhan/games/models/quizprovider.dart';
//
// // class PrinQuiz extends StatefulWidget {
// //   const PrinQuiz({super.key});
// //
// //   @override
// //   State<PrinQuiz> createState() => _PrinQuizState();
// // }
// //
// // class _PrinQuizState extends State<PrinQuiz> {
// //   int? selectedAnswerIndex;
// //   int questionIndex = 0;
// //   int score = 0;
// //
// //   void pickAnswer(int value) {
// //     selectedAnswerIndex = value;
// //     final question = questions[questionIndex];
// //     if (selectedAnswerIndex == question.correctAnswerIndex) {
// //       score++;
// //     }
// //     setState(() {});
// //   }
// //
// //   void goToNextQuestion() {
// //     if (questionIndex < questions.length - 1) {
// //       questionIndex++;
// //       selectedAnswerIndex = null;
// //     }
// //     setState(() {});
// //   }
// //
// //   void goToPrevQuestion() {
// //     if (questionIndex > 0) {
// //       questionIndex--;
// //       selectedAnswerIndex = null;
// //     }
// //     setState(() {});
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final question = questions[questionIndex];
// //     bool isLastQuestion = questionIndex == questions.length - 1;
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Quiz'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(24.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: [
// //             Text(
// //               question.question,
// //               style: const TextStyle(
// //                 fontSize: 21,
// //               ),
// //               textAlign: TextAlign.center,
// //             ),
// //             ListView.builder(
// //               shrinkWrap: true,
// //               itemCount: question.options.length,
// //               itemBuilder: (context, index) {
// //                 return GestureDetector(
// //                   onTap: selectedAnswerIndex == null
// //                       ? () => pickAnswer(index)
// //                       : null,
// //                   child: AnswerCard(
// //                     currentIndex: index,
// //                     question: question.options[index],
// //                     isSelected: selectedAnswerIndex == index,
// //                     selectedAnswerIndex: selectedAnswerIndex,
// //                     correctAnswerIndex: question.correctAnswerIndex,
// //                   ),
// //                 );
// //               },
// //             ),
// //             // Next Button
// //             isLastQuestion
// //                 ? RectangularButton(
// //                     onPressed: () {
// //                       Navigator.of(context).pushReplacement(
// //                         MaterialPageRoute(
// //                           builder: (_) => ResultScreen(
// //                             score: score,
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                     label: 'Finish',
// //                   )
// //                 : RectangularButton(
// //                     onPressed:
// //                         selectedAnswerIndex != null ? goToNextQuestion : null,
// //                     label: 'Next',
// //                   ),
// //                 RectangularButton(
// //                     onPressed:
// //                         selectedAnswerIndex == null ? goToPrevQuestion : null,
// //                     label: 'previous'
// //       ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// class QuizScreen extends StatelessWidget {
//   final List<Question> questions;
//
//   const QuizScreen({super.key, required this.questions});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => QuizProvider(questions),
//       child: Consumer<QuizProvider>(
//         builder: (context, quizProvider, child) {
//           final question = quizProvider.questions[quizProvider.currentQuestionIndex];
//           final isLastQuestion = quizProvider.currentQuestionIndex == quizProvider.questions.length - 1;
//
//           return Scaffold(
//             // ... (rest of the quiz screen code)
//             body: Column(
//               // ... (rest of the quiz screen code)
//               ListView.builder(
//                 // ... (rest of the quiz screen code)
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: quizProvider.selectedAnswerIndex == null
//                         ? () => quizProvider.selectAnswer(index)
//                         : null,
//                     child: AnswerCard(
//                       // ... (rest of the AnswerCard code)
//                     ),
//                   );
//                 },
//               ),
//               // ... (rest of the quiz screen code)
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
