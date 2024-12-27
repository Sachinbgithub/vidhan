// constitution_quiz.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConstitutionQuiz extends StatefulWidget {
  const ConstitutionQuiz({super.key});

  @override
  State<ConstitutionQuiz> createState() => _ConstitutionQuizState();
}

class _ConstitutionQuizState extends State<ConstitutionQuiz> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedAnswerIndex;
  List<Map<String, dynamic>> _dailyQuestions = [];

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Which part of the Constitution deals with the State?',
      'options': ['Part I', 'Part II', 'Part III', 'Part IV'],
      'correctAnswer': 0,
    },
    {
      'question': 'Article 12 defines what term?',
      'options': ['State', 'Fundamental Rights', 'Law', 'Citizenship'],
      'correctAnswer': 0,
    },
    {
      'question': 'Right to Equality is covered under which Article?',
      'options': ['Article 14-18', 'Article 19-22', 'Article 23-24', 'Article 25-28'],
      'correctAnswer': 0,
    },
    {
      'question': 'Which Article abolishes Untouchability?',
      'options': ['Article 17', 'Article 18', 'Article 19', 'Article 20'],
      'correctAnswer': 0,
    },
    {
      'question': 'Right to Freedom is guaranteed under:',
      'options': ['Article 19-22', 'Article 23-24', 'Article 25-28', 'Article 29-30'],
      'correctAnswer': 0,
    },
    {
      'question': 'Protection against arrest and detention is provided under:',
      'options': ['Article 22', 'Article 21', 'Article 20', 'Article 19'],
      'correctAnswer': 0,
    },
    {
      'question': 'Right against Exploitation is covered under:',
      'options': ['Article 23-24', 'Article 25-28', 'Article 29-30', 'Article 32'],
      'correctAnswer': 0,
    },
    {
      'question': 'Freedom of Religion is guaranteed under:',
      'options': ['Article 25-28', 'Article 29-30', 'Article 32', 'Article 33'],
      'correctAnswer': 0,
    },
    {
      'question': 'Cultural and Educational Rights are provided under:',
      'options': ['Article 29-30', 'Article 32', 'Article 33', 'Article 34'],
      'correctAnswer': 0,
    },
    {
      'question': 'Right to Constitutional Remedies is guaranteed under:',
      'options': ['Article 32', 'Article 33', 'Article 34', 'Article 35'],
      'correctAnswer': 0,
    },
  ];

  Future<void> _updateRewardPoints() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        final currentPoints = userDoc.data()?['rewardPoints'] ?? 0;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'rewardPoints': currentPoints + _score});
      }
    } catch (e) {
      print('Error updating reward points: $e');
    }
  }

  void _checkAnswer(int selectedIndex) {
    if (_answered) return;

    final shuffledQuestions = List<Map<String, dynamic>>.from(_questions)
      ..shuffle();
    _dailyQuestions = shuffledQuestions.take(10).toList();

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _answered = true;
      if (selectedIndex == _questions[_currentQuestionIndex]['correctAnswer']) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentQuestionIndex < _questions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answered = false;
          _selectedAnswerIndex = null;
        });
      } else {
        _updateRewardPoints();
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Your score: $_score/${_questions.length}'),
            const SizedBox(height: 10),
            Text(
              _score >= 7 ? 'Great job! 🎉' :
              _score >= 5 ? 'Good effort! 👍' : 'Keep practicing! 💪',
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/nav', (route) => false);
            },
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constitution Quiz'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                'Score: $_score/${_questions.length}',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LinearProgressIndicator(
              value: (_currentQuestionIndex + 1) / _questions.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Question ${_currentQuestionIndex + 1}/${_questions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ..._buildAnswerButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnswerButtons() {
    return List.generate(
      _questions[_currentQuestionIndex]['options'].length,
          (index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: _answered ? null : () => _checkAnswer(index),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
              if (_answered) {
                if (index == _questions[_currentQuestionIndex]['correctAnswer']) {
                  return Colors.green;
                }
                if (index == _selectedAnswerIndex) {
                  return Colors.red;
                }
              }
              return Theme.of(context).primaryColor;
            }),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          child: Text(
            _questions[_currentQuestionIndex]['options'][index],
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}