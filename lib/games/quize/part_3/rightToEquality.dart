import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RightToEquality extends StatefulWidget {
  const RightToEquality({super.key});

  @override
  State<RightToEquality> createState() => _RightToEqualityState();
}

class _RightToEqualityState extends State<RightToEquality> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedAnswerIndex;
  List<Map<String, dynamic>> _selectQuestions = [];

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Which Article of the Constitution guarantees equality before the law?',
      'options': ['Article 12', 'Article 13', 'Article 14', 'Article 15'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 14 ensure?',
      'options': ['Equality before law', 'Abolition of untouchability', 'Freedom of speech', 'Right to property'],
      'correctAnswer': 0,
    },
    {
      'question': 'Which Article prohibits discrimination on grounds of religion, race, caste, sex, or place of birth?',
      'options': ['Article 14', 'Article 15', 'Article 16', 'Article 17'],
      'correctAnswer': 1,
    },
    {
      'question': 'Article 15(3) allows for special provisions for which group?',
      'options': ['Children', 'Women', 'Both Women and Children', 'Scheduled Castes'],
      'correctAnswer': 2,
    },
    {
      'question': 'What is prohibited under Article 15(2)?',
      'options': ['Untouchability', 'Discrimination in access to public spaces', 'Freedom of religion', 'Bonded labor'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article ensures equality of opportunity in matters of public employment?',
      'options': ['Article 14', 'Article 15', 'Article 16', 'Article 17'],
      'correctAnswer': 2,
    },
    {
      'question': 'Under Article 16(4), reservations can be made for which group?',
      'options': ['Economically weaker sections', 'Backward classes', 'Women', 'Children'],
      'correctAnswer': 1,
    },
    {
      'question': 'What does Article 16(2) prohibit?',
      'options': ['Reservations', 'Discrimination in public employment', 'Special provisions for women', 'Religious education in state schools'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article abolishes untouchability?',
      'options': ['Article 14', 'Article 15', 'Article 16', 'Article 17'],
      'correctAnswer': 3,
    },
    {
      'question': 'What is the penalty for enforcing untouchability under Article 17?',
      'options': ['Fine only', 'Imprisonment only', 'Both fine and imprisonment', 'No penalty specified'],
      'correctAnswer': 2,
    },
    {
      'question': 'Which Article abolishes titles except for military or academic distinctions?',
      'options': ['Article 14', 'Article 15', 'Article 16', 'Article 18'],
      'correctAnswer': 3,
    },
    {
      'question': 'What does Article 18(1) prohibit?',
      'options': ['Use of national titles', 'Foreign titles', 'Military distinctions', 'Use of educational titles'],
      'correctAnswer': 1,
    },
    {
      'question': 'Article 14 applies equally to?',
      'options': ['Citizens only', 'Non-citizens only', 'Both citizens and non-citizens', 'Foreign diplomats only'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 15(4) permit?',
      'options': ['Special provisions for Scheduled Castes and Scheduled Tribes', 'Reservation for economically weaker sections', 'Abolition of religious discrimination', 'Right to property'],
      'correctAnswer': 0,
    },
    {
      'question': 'Which Article ensures no discrimination in access to shops, restaurants, and public places?',
      'options': ['Article 15', 'Article 16', 'Article 17', 'Article 18'],
      'correctAnswer': 0,
    },
    {
      'question': 'What does Article 16(3) allow the Parliament to do?',
      'options': ['Provide reservations for women', 'Make laws for special employment conditions for certain regions', 'Abolish discrimination in public places', 'None of the above'],
      'correctAnswer': 1,
    },
    {
      'question': 'Article 17 abolishes untouchability and prohibits its?',
      'options': ['Practice', 'Propagation', 'Enforcement', 'All of the above'],
      'correctAnswer': 3,
    },
    {
      'question': 'What does Article 18(2) prohibit?',
      'options': ['Awarding hereditary titles', 'Educational qualifications', 'Military distinctions', 'None of the above'],
      'correctAnswer': 0,
    },
    {
      'question': 'Equality before the law is inspired by which country’s Constitution?',
      'options': ['USA', 'UK', 'Canada', 'Australia'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article was introduced for reservation in private unaided institutions?',
      'options': ['Article 15(5)', 'Article 16(4A)', 'Article 15(3)', 'Article 18'],
      'correctAnswer': 0,
    },
    {
      'question': 'Article 15 permits special provisions for?',
      'options': ['Economically weaker sections', 'Women and children', 'Foreign nationals', 'None of the above'],
      'correctAnswer': 1,
    },
    {
      'question': 'Article 16 ensures equal opportunity in?',
      'options': ['Public employment', 'Private employment', 'Education', 'Property rights'],
      'correctAnswer': 0,
    },
    {
      'question': 'Article 18(3) prohibits citizens from accepting titles from?',
      'options': ['The Indian Government', 'Foreign states', 'State governments', 'Private organizations'],
      'correctAnswer': 1,
    },
    {
      'question': 'What does Article 15(1) prohibit?',
      'options': ['Discrimination in public employment', 'Discrimination by the State', 'Special provisions for backward classes', 'Abolition of titles'],
      'correctAnswer': 1,
    },
    {
      'question': 'What is the core principle of Article 14?',
      'options': ['Justice', 'Liberty', 'Equality before the law', 'Fraternity'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 16(4A) provide for?',
      'options': ['Reservation in promotions for SC/ST', 'Special employment for women', 'Reservation in education', 'Right to free speech'],
      'correctAnswer': 0,
    },
    {
      'question': 'Article 18(4) allows the government to confer?',
      'options': ['Military awards', 'Titles of honor', 'Educational certificates', 'All of the above'],
      'correctAnswer': 1,
    },
    {
      'question': 'What does the doctrine of “equal protection of the laws” under Article 14 imply?',
      'options': ['Identical laws for all', 'Different treatment for equals', 'Equal treatment under similar circumstances', 'None of the above'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 15(6) introduce?',
      'options': ['Reservation for economically weaker sections', 'Abolition of untouchability', 'Equality before the law', 'Freedom of religion'],
      'correctAnswer': 0,
    },
    {
      'question': 'Article 16(1) applies to?',
      'options': ['Citizens only', 'Non-citizens only', 'Both citizens and non-citizens', 'Foreign nationals'],
      'correctAnswer': 0,
    },
  ];

  @override
  void initState() {
    super.initState();
    final shuffledQuestions = List<Map<String, dynamic>>.from(_questions)
      ..shuffle();
    _selectQuestions = shuffledQuestions.take(10).toList();
  }

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

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _answered = true;
      if (selectedIndex == _selectQuestions[_currentQuestionIndex]['correctAnswer']) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentQuestionIndex < _selectQuestions.length - 1) {
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
            Text('Your score: $_score/${_selectQuestions.length}'),
            const SizedBox(height: 10),
            Text(
              _score >= 7
                  ? 'Great job! 🎉'
                  : _score >= 5
                  ? 'Good effort! 👍'
                  : 'Keep practicing! 💪',
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
                'Score: $_score/${_selectQuestions.length}',
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
              value: (_currentQuestionIndex + 1) / _selectQuestions.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Question ${_currentQuestionIndex + 1}/${_selectQuestions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _selectQuestions[_currentQuestionIndex]['question'],
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
      _selectQuestions[_currentQuestionIndex]['options'].length,
          (index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: _answered ? null : () => _checkAnswer(index),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (_answered) {
                if (index == _selectQuestions[_currentQuestionIndex]['correctAnswer']) {
                  return Colors.green;
                }
                if (index == _selectedAnswerIndex) {
                  return Colors.red;
                }
              }
              return Theme.of(context).primaryColor;
            }),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          child: Text(
            _selectQuestions[_currentQuestionIndex]['options'][index],
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
