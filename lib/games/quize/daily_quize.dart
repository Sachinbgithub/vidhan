import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DailyConstitutionQuiz extends StatefulWidget {
  const DailyConstitutionQuiz({super.key});

  @override
  State<DailyConstitutionQuiz> createState() => _DailyConstitutionQuizState();
}

class _DailyConstitutionQuizState extends State<DailyConstitutionQuiz> {
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
      'question': 'What is the total number of fundamental rights in the Indian Constitution?',
      'options': ['6', '7', '5', '8'],
      'correctAnswer': 2,
    },
    {
      'question': 'Which Article abolishes untouchability in India?',
      'options': ['Article 15', 'Article 16', 'Article 17', 'Article 18'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 19 provide?',
      'options': ['Freedom of Speech and Expression', 'Abolition of Titles', 'Protection from Exploitation', 'Cultural Rights'],
      'correctAnswer': 0,
    },
    {
      'question': 'Directive Principles of State Policy are included in which part of the Constitution?',
      'options': ['Part III', 'Part IV', 'Part V', 'Part VI'],
      'correctAnswer': 1,
    },
    {
      'question': 'What does Article 21 guarantee?',
      'options': ['Right to Education', 'Right to Property', 'Right to Life and Personal Liberty', 'Right to Equality'],
      'correctAnswer': 2,
    },
    {
      'question': 'Which amendment added the Right to Education as a Fundamental Right?',
      'options': ['86th Amendment', '42nd Amendment', '44th Amendment', '74th Amendment'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is described under Article 32 of the Indian Constitution?',
      'options': ['Writs for Enforcement of Fundamental Rights', 'Right to Property', 'Right to Equality', 'Freedom of Speech'],
      'correctAnswer': 0,
    },
    {
      'question': 'Who is considered the custodian of the Indian Constitution?',
      'options': ['The President', 'The Parliament', 'The Supreme Court', 'The Prime Minister'],
      'correctAnswer': 2,
    },
    {
      'question': 'Which Article specifies the election of the President of India?',
      'options': ['Article 52', 'Article 54', 'Article 55', 'Article 56'],
      'correctAnswer': 1,
    },
    {
      'question': 'The Constitution of India was adopted on which date?',
      'options': ['26th January 1950', '15th August 1947', '26th November 1949', '1st January 1950'],
      'correctAnswer': 2,
    },
    {
      'question': 'How many schedules are there in the Indian Constitution originally?',
      'options': ['8', '10', '11', '12'],
      'correctAnswer': 0,
    },
    {
      'question': 'Which part of the Constitution is referred to as the "Magna Carta of India"?',
      'options': ['Part I', 'Part III', 'Part IV', 'Part V'],
      'correctAnswer': 1,
    },
    {
      'question': 'What is described under Article 24?',
      'options': ['Right to Education', 'Prohibition of Child Labour', 'Cultural and Educational Rights', 'Abolition of Untouchability'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article mentions the protection of monuments and places of national importance?',
      'options': ['Article 48', 'Article 49', 'Article 50', 'Article 51'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article deals with the right to constitutional remedies?',
      'options': ['Article 31', 'Article 32', 'Article 33', 'Article 34'],
      'correctAnswer': 1,
    },
    {
      'question': 'The Constitution of India is described as?',
      'options': ['Rigid', 'Flexible', 'Rigid and Flexible', 'None of the Above'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 51 promote?',
      'options': ['Uniform Civil Code', 'Promotion of International Peace', 'Right to Work', 'Right to Constitutional Remedies'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article mentions the separation of Judiciary from the Executive?',
      'options': ['Article 48', 'Article 50', 'Article 49', 'Article 51'],
      'correctAnswer': 1,
    },
    {
      'question': 'What is the term of the President of India as per the Constitution?',
      'options': ['4 Years', '5 Years', '6 Years', '7 Years'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article provides for the amendment of the Constitution?',
      'options': ['Article 366', 'Article 368', 'Article 370', 'Article 372'],
      'correctAnswer': 1,
    },
    {
      'question': 'What is the Preamble of the Constitution?',
      'options': ['Introduction', 'Part of Fundamental Rights', 'Directive Principles', 'None of the Above'],
      'correctAnswer': 0,
    },
    {
      'question': 'Which Article relates to the prohibition of discrimination?',
      'options': ['Article 13', 'Article 14', 'Article 15', 'Article 16'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 18 abolish?',
      'options': ['Untouchability', 'Titles', 'Child Labour', 'Slavery'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article provides for the promotion of Indian languages?',
      'options': ['Article 340', 'Article 341', 'Article 343', 'Article 351'],
      'correctAnswer': 3,
    },
    {
      'question': 'Who has the power to declare a financial emergency?',
      'options': ['President', 'Prime Minister', 'Parliament', 'Supreme Court'],
      'correctAnswer': 0,
    },
    {
      'question': 'What is the minimum age for election as a member of the Lok Sabha?',
      'options': ['18 years', '25 years', '30 years', '35 years'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which Article deals with Freedom of Press?',
      'options': ['Article 19', 'Article 20', 'Article 21', 'Article 22'],
      'correctAnswer': 0,
    },
    {
      'question': 'Who is responsible for the Union Budget?',
      'options': ['President', 'Finance Minister', 'Prime Minister', 'Parliament'],
      'correctAnswer': 1,
    },
    {
      'question': 'What does the Tenth Schedule deal with?',
      'options': ['Anti-Defection', 'Union Territories', 'Official Languages', 'Special Provisions'],
      'correctAnswer': 0,
    },
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
      'question': 'Who is known as the Father of the Indian Constitution?',
      'options': ['Mahatma Gandhi', 'B. R. Ambedkar', 'Jawaharlal Nehru', 'Sardar Patel'],
      'correctAnswer': 1,
    },
    {
      'question': 'Which schedule of the Indian Constitution deals with languages?',
      'options': ['Fifth Schedule', 'Seventh Schedule', 'Eighth Schedule', 'Tenth Schedule'],
      'correctAnswer': 2,
    },
    {
      'question': 'What does Article 21 guarantee?',
      'options': ['Right to Equality', 'Right to Freedom of Speech', 'Right to Life and Personal Liberty', 'Right against Exploitation'],
      'correctAnswer': 2,
    },
    {
      'question': 'The concept of Directive Principles of State Policy is borrowed from which country?',
      'options': ['USA', 'Ireland', 'UK', 'Australia'],
      'correctAnswer': 1,
    },
    {
      'question': 'The Preamble of the Constitution declares India as a?',
      'options': ['Sovereign Socialist Secular Democratic Republic', 'Federal State', 'Union of States', 'Parliamentary State'],
      'correctAnswer': 0,
    },
    {
      'question': 'Which Article of the Constitution deals with the Abolition of Untouchability?',
      'options': ['Article 14', 'Article 17', 'Article 19', 'Article 21'],
      'correctAnswer': 1,
    },
    {
      'question': 'Emergency provisions are covered under which part of the Constitution?',
      'options': ['Part XIV', 'Part XVIII', 'Part XIX', 'Part XX'],
      'correctAnswer': 1,
    },
    // Add all 200 questions here...
  ];

  @override
  void initState() {
    super.initState();
    _checkAndSetupDailyQuiz();
  }

  String _getTodayDate() {
    final now = DateTime.now();
    return '${now.year}-${now.month}-${now.day}';
  }

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
      final todayDate = _getTodayDate();
      _currentStreak = userDoc.data()?['dailyStreak'] ?? 0;

      if (lastQuizDate == todayDate) {
        setState(() => _quizAvailable = false);
        return;
      }

      // Check if streak should be reset
      if (lastQuizDate != null) {
        final lastQuizDateTime = DateTime.parse(lastQuizDate);
        final today = DateTime.now();
        final difference = today.difference(lastQuizDateTime).inDays;

        if (difference > 1) {
          // Reset streak if more than one day has passed
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .update({'dailyStreak': 0});
          _currentStreak = 0;
        }
      }

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

  Future<void> _updateDailyQuizScore() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final userDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid);

        // Get current user data
        final userData = await userDoc.get();
        final currentStreak = userData.data()?['dailyStreak'] ?? 0;
        final lastQuizDate = userData.data()?['lastDailyQuizDate'];

        // Calculate new streak
        int newStreak = currentStreak;
        if (lastQuizDate != null) {
          final lastQuizDateTime = DateTime.parse(lastQuizDate);
          final today = DateTime.now();
          final difference = today.difference(lastQuizDateTime).inDays;

          if (difference == 1) {
            // Increment streak if quiz taken on consecutive day
            newStreak = currentStreak + 1;
          } else if (difference > 1) {
            // Reset streak if day was skipped
            newStreak = 1;
          }
        } else {
          // First quiz
          newStreak = 1;
        }

        // Update all quiz data
        await userDoc.update({
          'lastDailyQuizDate': _getTodayDate(),
          'dailyQuizScores': FieldValue.arrayUnion([{
            'date': _getTodayDate(),
            'score': _score,
          }]),
          'totalQuizPoints': FieldValue.increment(_score),
          'dailyStreak': newStreak,
        });

        // Extra points for maintaining streak
        if (newStreak > currentStreak && newStreak > 1) {
          await userDoc.update({
            'totalQuizPoints': FieldValue.increment(newStreak), // Bonus points equal to streak
          });
        }
      }
    } catch (e) {
      print('Error updating daily quiz score: $e');
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
        _updateDailyQuizScore();
        _showResultDialog();
      }
    });
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Daily Quiz Completed!'),
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
            if (_currentStreak > 0) Text(
              'Current Streak: $_currentStreak days 🔥\n'
                  'Streak bonus: +$_currentStreak points!',
              textAlign: TextAlign.center,
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

  Widget _buildQuizUnavailableMessage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.timer_off, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Daily Quiz Already Completed',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Come back tomorrow for new questions!\nMaintain your streak for bonus points!',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            if (_currentStreak > 0) Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Current Streak: $_currentStreak days 🔥',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
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
        body: _buildQuizUnavailableMessage(),
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