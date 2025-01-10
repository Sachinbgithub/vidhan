// Daily quiz code
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FactsQuiz extends StatefulWidget {
  const FactsQuiz({super.key});

  @override
  State<FactsQuiz> createState() => _FactsQuizState();
}

class _FactsQuizState extends State<FactsQuiz> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  int? _selectedAnswerIndex;
  List<Map<String, dynamic>> _dailyQuestions = [];
  bool _quizAvailable = true;
  bool _loading = true;
  int _currentStreak = 0;

  // All 200 questions stored here
  final List<Map<String, dynamic>> _allQuestions = [
  {
        "question": "When did the Constitution of India come into effect?",
        "options": ["15th August 1947", "26th January 1950", "26th November 1949", "1st January 1950"],
        "correctAnswer": 1
      },
      {
        "question": "How many schedules are there in the Indian Constitution?",
        "options": ["8", "10", "12", "14"],
        "correctAnswer": 2
      },
      {
        "question": "What is the term used to describe India in the Preamble?",
        "options": ["Sovereign Socialist Secular Democratic Republic", "Federal Democratic Republic", "Union of States", "Confederation of States"],
        "correctAnswer": 0
      },
      {
        "question": "Who was the chairman of the Drafting Committee of the Indian Constitution?",
        "options": ["Dr. Rajendra Prasad", "B.R. Ambedkar", "Jawaharlal Nehru", "C. Rajagopalachari"],
        "correctAnswer": 1
      },
      {
        "question": "Which part of the Constitution deals with Fundamental Rights?",
        "options": ["Part II", "Part III", "Part IV", "Part V"],
        "correctAnswer": 1
      },
      {
        "question": "Which article of the Indian Constitution abolishes untouchability?",
        "options": ["Article 15", "Article 17", "Article 19", "Article 21"],
        "correctAnswer": 1
      },
      {
        "question": "Which amendment is known as the 'Mini-Constitution'?",
        "options": ["42nd Amendment", "44th Amendment", "52nd Amendment", "73rd Amendment"],
        "correctAnswer": 0
      },
      {
        "question": "Which language is recognized as the official language of India?",
        "options": ["English", "Sanskrit", "Hindi", "Tamil"],
        "correctAnswer": 2
      },
      {
        "question": "What is the maximum strength of the Lok Sabha?",
        "options": ["500", "525", "545", "552"],
        "correctAnswer": 3
      },
      {
        "question": "Which article of the Constitution deals with the Right to Equality?",
        "options": ["Article 12", "Article 14", "Article 16", "Article 18"],
        "correctAnswer": 1
      },
      {
        "question": "What does Article 1 of the Indian Constitution state?",
        "options": [
          "India shall be a Sovereign Republic",
          "India shall be a Union of States",
          "India shall adopt Universal Adult Franchise",
          "India shall promote International Peace"
        ],
        "correctAnswer": 1
      },
      {
        "question": "Who is responsible for appointing the Chief Justice of India?",
        "options": ["The President", "The Prime Minister", "The Supreme Court", "The Parliament"],
        "correctAnswer": 0
      },
      {
        "question": "Which is the longest written Constitution in the world?",
        "options": ["USA", "UK", "India", "Australia"],
        "correctAnswer": 2
      },
      {
        "question": "What is the minimum age to become the President of India?",
        "options": ["25 years", "30 years", "35 years", "40 years"],
        "correctAnswer": 2
      },
      {
        "question": "What is the tenure of the Rajya Sabha members?",
        "options": ["5 years", "6 years", "4 years", "Permanent body"],
        "correctAnswer": 3
      },
      {
        "question": "Which article provides special status to Jammu and Kashmir?",
        "options": ["Article 368", "Article 370", "Article 35A", "Article 395"],
        "correctAnswer": 1
      },
      {
        "question": "How many Fundamental Duties are listed in the Indian Constitution?",
        "options": ["10", "11", "9", "12"],
        "correctAnswer": 1
      },
      {
        "question": "What does the 73rd amendment deal with?",
        "options": ["Urban Local Bodies", "Panchayati Raj", "Education", "Reservation"],
        "correctAnswer": 1
      },
      {
        "question": "The concept of 'Directive Principles of State Policy' is borrowed from which country's Constitution?",
        "options": ["USA", "Ireland", "UK", "Canada"],
        "correctAnswer": 1
      },
      {
        "question": "Who was the first President of India?",
        "options": ["B.R. Ambedkar", "Jawaharlal Nehru", "Dr. Rajendra Prasad", "Sardar Patel"],
        "correctAnswer": 2
      },
      {
        "question": "Which article mentions the Election Commission of India?",
        "options": ["Article 324", "Article 330", "Article 350", "Article 360"],
        "correctAnswer": 0
      },
      {
        "question": "Which Fundamental Right guarantees freedom of speech and expression?",
        "options": ["Right to Equality", "Right to Freedom", "Right against Exploitation", "Right to Constitutional Remedies"],
        "correctAnswer": 1
      },
      {
        "question": "In which year was the Right to Education made a Fundamental Right?",
        "options": ["2000", "2002", "2010", "2012"],
        "correctAnswer": 2
      },
      {
        "question": "How many states and union territories does India have?",
        "options": ["28 states and 7 UTs", "29 states and 7 UTs", "28 states and 8 UTs", "29 states and 8 UTs"],
        "correctAnswer": 2
      },
      {
        "question": "Which amendment reduced the voting age from 21 to 18?",
        "options": ["42nd", "44th", "61st", "73rd"],
        "correctAnswer": 2
      },
      {
        "question": "What does the 44th amendment of the Indian Constitution deal with?",
        "options": [
          "Right to Education",
          "Right to Property",
          "Panchayati Raj",
          "Emergency provisions"
        ],
        "correctAnswer": 1
      },
      {
        "question": "Which Prime Minister of India initiated the Green Revolution?",
        "options": ["Jawaharlal Nehru", "Lal Bahadur Shastri", "Indira Gandhi", "Rajiv Gandhi"],
        "correctAnswer": 1
      },
      {
        "question": "Who was the first female Prime Minister of India?",
        "options": ["Indira Gandhi", "Pratibha Patil", "Sarojini Naidu", "Sushma Swaraj"],
        "correctAnswer": 0
      },
      {
        "question": "Which river is called the 'Ganga of the South'?",
        "options": ["Godavari", "Cauvery", "Krishna", "Tungabhadra"],
        "correctAnswer": 1
      },
      {
        "question": "Where is the headquarters of the Supreme Court of India located?",
        "options": ["Kolkata", "Mumbai", "Delhi", "Chennai"],
        "correctAnswer": 2
      },
      {
        "question": "Who is the current Chief Justice of India?",
        "options": ["N.V. Ramana", "Uday Umesh Lalit", "D.Y. Chandrachud", "Justice Gogoi"],
        "correctAnswer": 2
      },
    {
      "question": "What is the supreme law of India?",
      "options": [
        "The Constitution",
        "The Parliament",
        "The President",
        "The Supreme Court"
      ],
      "correctAnswer": 0,
    },
    {
      "question": "How many articles are there in the Indian Constitution?",
      "options": ["395", "450", "300", "250"],
      "correctAnswer": 0,
    },
    {
      "question": "Who is known as the Father of the Indian Constitution?",
      "options": [
        "B.R. Ambedkar",
        "Jawaharlal Nehru",
        "Mahatma Gandhi",
        "Sardar Patel"
      ],
      "correctAnswer": 0,
    },
    {
      "question": "Which part of the Constitution contains Fundamental Rights?",
      "options": ["Part III", "Part IV", "Part II", "Part I"],
      "correctAnswer": 0,
    },
    {
      "question": "What does Article 21 guarantee?",
      "options": [
        "Right to Life and Personal Liberty",
        "Right to Equality",
        "Right to Freedom of Speech",
        "Right to Education"
      ],
      "correctAnswer": 0,
    },
    {
      "question":
          "'We, the People of India' is found in which part of the Constitution?",
      "options": [
        "Preamble",
        "Fundamental Rights",
        "Directive Principles",
        "Fundamental Duties"
      ],
      "correctAnswer": 0,
    },
    {
      "question": "'Equality before law' is a feature of which article?",
      "options": ["Article 14", "Article15", "Article16", "Article17"],
      "correctAnswer": 0,
    },
    // Add all 200 questions here...
  ];

  @override
  void initState() {
    super.initState();
    _checkAndSetupDailyQuiz();
  }

  // String _getTodayDate() {
  //   final now = DateTime.now();
  //   return '${now.year}-${now.month}-${now.day}';
  // }

  Future<void> _checkAndSetupDailyQuiz() async {
    setState(() => _loading = false);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        setState(() => _quizAvailable = false);
        return;
      }

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      final lastQuizDate = userDoc.data()?['lastDailyQuizDate'];
      _currentStreak = userDoc.data()?['dailyStreak'] ?? 0;

      // Generate daily questions
      final shuffledQuestions = List<Map<String, dynamic>>.from(_allQuestions)
        ..shuffle();
      _dailyQuestions = shuffledQuestions.take(10).toList();

      setState(() {
        _quizAvailable = true;
        _loading = false;
      });
    } catch (e) {
      print('Error setting up daily quiz: $e');
      setState(() => _loading = false);
    }
  }

  void _checkAnswer(int selectedIndex) {
    if (_answered) return;

    setState(() {
      _selectedAnswerIndex = selectedIndex;
      _answered = true;
      if (selectedIndex == _dailyQuestions[_currentQuestionIndex]['correctAnswer']) {
        _score++;
      }
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (_currentQuestionIndex < _dailyQuestions.length - 1) {
        setState(() {
          _currentQuestionIndex++;
          _answered = false;
          _selectedAnswerIndex = null;
        });
      } else {
        // _updateDailyQuizScore();
        // _showResultDialog();
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
            Text('Your score: $_score/${_dailyQuestions.length}'),
            const SizedBox(height: 10),
            Text(
              _score >= 7 ? 'Excellent! 🎉' :
              _score >= 5 ? 'Good effort! 👍' : 'Keep learning! 💪',
            ),
            const SizedBox(height: 16),
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
    if (_loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (!_quizAvailable) {
      return Scaffold(
        appBar: AppBar(title: const Text('Daily Quiz')),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(child: Text("Log in to play available")),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Constitution Quiz'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                children: [
                  Text(
                    'Score: $_score/${_dailyQuestions.length}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  if (_currentStreak > 0) Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: [
                        const Icon(Icons.local_fire_department, color: Colors.orange),
                        Text(
                          ' $_currentStreak',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
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
              value: (_currentQuestionIndex + 1) / _dailyQuestions.length,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Question ${_currentQuestionIndex + 1}/${_dailyQuestions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              _dailyQuestions[_currentQuestionIndex]['question'],
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
      _dailyQuestions[_currentQuestionIndex]['options'].length,
          (index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: _answered ? null : () => _checkAnswer(index),
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (_answered) {
                if (index == _dailyQuestions[_currentQuestionIndex]['correctAnswer']) {
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
            _dailyQuestions[_currentQuestionIndex]['options'][index],
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}