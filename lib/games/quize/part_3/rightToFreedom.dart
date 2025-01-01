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
      'question': 'What freedoms are guaranteed under Article 19(1)?',
      'options': [
        'Freedom of speech',
        'Freedom of assembly',
        'Freedom to form associations',
        'All of the above'
      ],
      'correctAnswer': 3,
    },
    {
      'question': 'Which clause under Article 19 allows restrictions on freedom of speech in the interest of public order?',
      'options': ['19(1)(a)', '19(2)', '19(3)', 'None'],
      'correctAnswer': 1,
    },
    {
      'question': 'Article 19(1)(c) guarantees which freedom?',
      'options': [
        'Freedom of speech and expression',
        'Freedom to form associations or unions',
        'Freedom of movement',
        'Freedom to reside and settle'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Which freedom is provided under Article 19(1)(d)?',
      'options': [
        'Freedom of speech',
        'Freedom to move freely throughout India',
        'Freedom to practice any profession',
        'Freedom of religion'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Article 19(1)(g) guarantees freedom to?',
      'options': [
        'Reside and settle',
        'Form associations',
        'Move freely',
        'Practice any profession, trade, or business'
      ],
      'correctAnswer': 3,
    },
    {
      'question': 'Which of the following is not a restriction under Article 19(2)?',
      'options': [
        'Defamation',
        'Contempt of court',
        'Freedom of religion',
        'Decency or morality'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 19(1)(e) guarantee?',
      'options': [
        'Right to reside and settle in any part of India',
        'Right to property',
        'Right to education',
        'Right to privacy'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Under which condition can the freedom to assemble be restricted under Article 19(3)?',
      'options': [
        'Sovereignty of India',
        'Public health',
        'Public order',
        'Employment'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Which Article allows citizens to move freely throughout the territory of India?',
      'options': [
        'Article 18',
        'Article 19(1)(d)',
        'Article 20',
        'Article 21'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article is related to protection against arbitrary deprivation of property?',
      'options': [
        'Article 19(1)(f)',
        'Article 19(1)(d)',
        'Article 20',
        'Article 21'
      ],
      'correctAnswer': 0,
    },

    // Article 20: Protection in Respect of Conviction for Offenses
    {
      'question': 'Which of the following is prohibited under Article 20(1)?',
      'options': [
        'Ex-post facto laws',
        'Freedom of religion',
        'Equality before the law',
        'Right to property'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'What does Article 20(2) prohibit?',
      'options': [
        'Double jeopardy',
        'Untouchability',
        'Censorship',
        'Freedom of press'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Which clause ensures protection against self-incrimination?',
      'options': ['Article 20(1)', 'Article 20(2)', 'Article 20(3)', 'Article 20(4)'],
      'correctAnswer': 2,
    },
    {
      'question': 'Article 20(3) applies to?',
      'options': [
        'Witnesses in court',
        'Accused persons',
        'General public',
        'Government officials'
      ],
      'correctAnswer': 1,
    },

    // Article 21: Right to Life and Personal Liberty
    {
      'question': 'What is guaranteed under Article 21?',
      'options': [
        'Right to life and personal liberty',
        'Right to vote',
        'Right to freedom of speech',
        'Right to privacy'
      ],
      'correctAnswer': 0,
    },
    {
      'question': 'Which judgment introduced the concept of “Right to Privacy” under Article 21?',
      'options': [
        'Maneka Gandhi case',
        'Kesavananda Bharati case',
        'Puttaswamy case',
        'Golaknath case'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Article 21A was added by which amendment?',
      'options': [
        '42nd Amendment',
        '44th Amendment',
        '86th Amendment',
        '74th Amendment'
      ],
      'correctAnswer': 2,
    },
    {
      'question': 'Right to education is guaranteed under which Article?',
      'options': [
        'Article 21',
        'Article 21A',
        'Article 19',
        'Article 22'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'What does Article 21 include as per the Supreme Court ruling?',
      'options': [
        'Right to shelter',
        'Right to health',
        'Right to livelihood',
        'All of the above'
      ],
      'correctAnswer': 3,
    },

    // Article 22: Protection Against Arrest and Detention
    {
      'question': 'Which Article protects individuals against arbitrary arrest?',
      'options': ['Article 20', 'Article 21', 'Article 22', 'Article 19'],
      'correctAnswer': 2,
    },
    {
      'question': 'How long can a person be detained without being informed of the charges under Article 22?',
      'options': ['12 hours', '24 hours', '48 hours', '72 hours'],
      'correctAnswer': 1,
    },
    {
      'question': 'What does Article 22(3) exclude from protection?',
      'options': [
        'Persons arrested for serious crimes',
        'Persons detained under preventive detention laws',
        'Persons accused of civil offenses',
        'Persons detained under foreign laws'
      ],
      'correctAnswer': 1,
    },
    {
      'question': 'Preventive detention is allowed for how many months without review under Article 22?',
      'options': ['3 months', '6 months', '9 months', '12 months'],
      'correctAnswer': 0,
    },
    {
      'question': 'Article 22 ensures a detainee has the right to?',
      'options': [
        'Meet a lawyer',
        'Challenge detention in court',
        'Be informed of charges',
        'All of the above'
      ],
      'correctAnswer': 3,
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
