import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MsgWidget extends StatelessWidget {
  const MsgWidget({
    super.key,
    required this.text,
    required this.isFromUser,
    this.userColor,
    this.botColor,
  });

  final String text;
  final bool isFromUser;
  final Color? userColor; // Optional color for user messages
  final Color? botColor;  // Optional color for bot messages

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            constraints: const BoxConstraints(maxWidth: 520),
            decoration: BoxDecoration(
              color: isFromUser
                  ? (userColor ?? Theme.of(context).colorScheme.primary) // Use userColor if provided
                  : (botColor ?? Theme.of(context).colorScheme.secondary), // Use botColor if provided
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              children: [
                MarkdownBody(data: text),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
//
// class msg_widget extends StatelessWidget {
//   const msg_widget({
//     super.key,
//     required this.text,
//     required this.isFromUser,
//   });
//
//   final String text;
//   final bool isFromUser;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: isFromUser ? MainAxisAlignment.end: MainAxisAlignment.start,
//       children: [
//         Flexible(
//           child: Container(
//             padding: const EdgeInsets.symmetric(
//               vertical: 15,
//               horizontal: 20,
//             ),
//             margin: const EdgeInsets.only(bottom: 8),
//             constraints: const BoxConstraints(maxWidth: 520),
//             decoration: BoxDecoration(
//               color: isFromUser
//                   ? Theme.of(context).colorScheme.primary
//                   : Theme.of(context).colorScheme.secondary,
//               borderRadius: BorderRadius.circular(18),
//             ),
//             child: Column(
//               children: [
//                 MarkdownBody(data: text),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
