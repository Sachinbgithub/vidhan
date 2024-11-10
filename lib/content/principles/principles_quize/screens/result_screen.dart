import 'package:flutter/material.dart';
import 'package:vidhan/games/TryScreen.dart';

import 'package:vidhan/games/quize/models/questions.dart';
import 'package:vidhan/games/quize/screens/quiz_screen.dart';
// import 'package:vidhan/games/quize/screens/quiz_screen.dart';
// import 'package:vidhan/games/quize/widgets/next_button.dart';

class PrinResult extends StatelessWidget {
  const PrinResult({
    super.key,
    required this.score,
  });

  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(width: 1000),
          const Text(
            'Your Score: ',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: score / 9,
                  color: Colors.green,
                  backgroundColor: Colors.white,
                ),
              ),
              Column(
                children: [
                  Text(
                    score.toString(),
                    style: const TextStyle(fontSize: 80),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${(score / questions.length * 100).round()}%',
                    style: const TextStyle(fontSize: 25),
                  )
                ],
              ),
            ],
            // }
          ),
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
            child: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50), // Full-width button
            ),
          ),
          ),
          SizedBox(
            // This pushes the button to the bottom
            child: ElevatedButton(
              onPressed: () {
                // Navigate back to the quiz screen or home screen
                Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Tryscreen(),
                    )); // Example navigation
              },
              child: const Text('Back To Home'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // Full-width button
              ),
            ),
          ),
        ],
      ),
    );
  }
}
