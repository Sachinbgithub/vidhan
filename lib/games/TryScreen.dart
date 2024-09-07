import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../games/quize/screens/quiz_screen.dart';

class Tryscreen extends StatefulWidget {
  const Tryscreen({super.key});

  @override
  State<Tryscreen> createState() => _TryscreenState();
}

class _TryscreenState extends State<Tryscreen>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.black38],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // This pushes the button to the bottom
              child: ElevatedButton(
                onPressed: () {
                  // Navigate back to the quiz screen or home screen
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(),
                      )); // Example navigation
                },
                child: const Text('Quiz Set-1'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Full-width button
                ),
              ),
            ),
          ]

            // Container(
            //   child: Image.asset('assets/logo.png'),
            // )
          // ],
        ),
      ),
    );
  }
}
