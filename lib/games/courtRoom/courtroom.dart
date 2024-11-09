import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(CourtroomGameApp());

class CourtroomGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Courtroom Game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CourtroomGameScreen(),
    );
  }
}

class CourtroomGameScreen extends StatefulWidget {
  @override
  _CourtroomGameScreenState createState() => _CourtroomGameScreenState();
}

class _CourtroomGameScreenState extends State<CourtroomGameScreen> with SingleTickerProviderStateMixin {
  int _storyIndex = 0;
  bool _showQuestion = false;
  int _score = 0;
  int _timer = 30;
  late Timer _countdownTimer;

  // Audio player for sound effects
  AudioPlayer _audioPlayer = AudioPlayer();

  // Example story content and questions
  final List<String> _storyParts = [
    "Ravi, a young entrepreneur from a small town, applies for a government grant to start his business. However, his application is rejected by the authorities without a valid reason, while similar applications from candidates in larger cities are approved. Ravi feels this is unfair and believes he is being discriminated against due to his background.",
    "Ravi decides to challenge this decision in court, citing Article 14 of the Indian Constitution, which guarantees that all citizens are equal before the law and ensures no discrimination based on place of origin or background.",
    "The court rules in Ravi's favor, emphasizing that every citizen is entitled to equal treatment under the law, regardless of their geographical location.",
    "Now, the jury awaited the final verdict.",
  ];

  final String _question = "Which article of the Indian Constitution protects Ravi’s right to equal treatment in the government grant application process?";
  final List<String> _options = [
    "Article 15",
    "Article 14",
    "Article 17",
    "Article 19",
  ];
  final String _correctAnswer = "Article 14";

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _controller.forward();
    _startTimer();
  }

  @override
  void dispose() {
    _controller.dispose();
    _countdownTimer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = 30;
    _countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timer > 0) {
        setState(() {
          _timer--;
        });
      } else {
        _countdownTimer.cancel();
        _answerQuestion(''); // Automatically answer as wrong when time runs out
      }
    });
  }

  void _stopTimer() {
    if (_countdownTimer.isActive) {
      _countdownTimer.cancel();
    }
  }

  void _answerQuestion(String answer) {
    _stopTimer();
    final isCorrect = answer == _correctAnswer;

    // Play sound based on answer correctness
    if (isCorrect) {
      _audioPlayer.play('assets/sounds/correct.wav' as Source);
      _score += 10; // Add points for correct answers
    } else {
      _audioPlayer.play('assets/sounds/wrong.mp3' as Source);
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isCorrect ? 'Correct!' : 'Wrong Answer'),
        content: Text(isCorrect
            ? 'You got the right answer! +10 Points'
            : 'The correct answer was "$_correctAnswer".'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _storyIndex = 0;
                _showQuestion = false;
              });
              _startTimer(); // Restart timer after question
            },
            child: Text('Restart Game'),
          ),
        ],
      ),
    );
  }

  void _nextPart() {
    if (_storyIndex < _storyParts.length - 1) {
      setState(() {
        _storyIndex++;
      });
    } else {
      setState(() {
        _showQuestion = true;
      });
    }
  }

  void _previousPart() {
    if (_storyIndex > 0) {
      setState(() {
        _storyIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Courtroom Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: _storyIndex / _storyParts.length,
              backgroundColor: Colors.grey,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 20),
            Text(
              'Score: $_score',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (!_showQuestion)
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/download.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      _storyParts[_storyIndex],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_storyIndex > 0)
                        FloatingActionButton(
                          onPressed: _previousPart,
                          child: Icon(Icons.arrow_back),
                          backgroundColor: Colors.grey,
                        ),
                      ScaleTransition(
                        scale: _animation,
                        child: FloatingActionButton(
                          onPressed: _nextPart,
                          child: Icon(Icons.navigate_next),
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            if (_showQuestion)
              Column(
                children: [
                  Text(
                    _question,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _options.map(
                          (option) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ElevatedButton(
                          onPressed: () => _answerQuestion(option),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                                fontSize: 18, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Time Left: $_timer seconds',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

