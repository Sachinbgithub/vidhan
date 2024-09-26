import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vidhan/games/TryScreen.dart';

import 'package:vidhan/games/quize/models/questions.dart';
import 'package:vidhan/games/quize/screens/quiz_screen.dart';
// import 'package:vidhan/games/quize/screens/quiz_screen.dart';
// import 'package:vidhan/games/quize/widgets/next_button.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.score,
  });
  Future<void> updateUserScore(int newScore) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'username': user.displayName ?? 'Anonymous',
        'score': newScore,
      }, SetOptions(merge: true));
    }
  }


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
                  // updateUserScore(score) as String,
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

