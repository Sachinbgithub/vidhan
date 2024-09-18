import 'dart:math';
import 'package:flutter/material.dart';

class GameHome extends StatelessWidget {
  const GameHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snake and Ladder')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GamePage(isMultiplayer: true)),
                );
              },
              child: const Text('Multiplayer Mode'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GamePage(isMultiplayer: false)),
                );
              },
              child: const Text('Computer Player Mode'),
            ),
          ],
        ),
      ),
    );
  }
}

class GamePage extends StatefulWidget {
  final bool isMultiplayer;

  const GamePage({Key? key, required this.isMultiplayer}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int player1Position = 0;
  int player2Position = 0;
  int currentPlayer = 1;

  final Map<int, int> snakes = {16: 6, 47: 26, 49: 11, 56: 53, 62: 19, 64: 60, 87: 24, 93: 73, 95: 75, 98: 78};

  final Map<int, int> ladders = {1: 38, 4: 14, 9: 31, 21: 42, 28: 84,
    // Additional ladders with quiz questions
  };

  final List<Question> questions = [
    Question("What is the supreme law of India?", ["Constitution", "Civil Code", "Judiciary", "Legislation"], "Constitution"),
    Question("Who is known as the Father of the Constitution?", ["Dr. B.R. Ambedkar", "Mahatma Gandhi", "Jawaharlal Nehru", "Sardar Patel"], "Dr. B.R. Ambedkar"),
    Question("What are Fundamental Rights?", ["Basic rights guaranteed to all citizens", "Rights for minorities", "Economic rights", "Social rights"], "Basic rights guaranteed to all citizens"),
    Question("What is the role of the President?", ["Head of State", "Head of Government", "Legislator", "Judiciary Head"], "Head of State"),
    Question("What is the significance of the Preamble?", ["Introduction to the Constitution", "Conclusion of laws", "Summary of rights", "None of the above"], "Introduction to the Constitution"),
  ];

  String? selectedAnswer;
  bool? isCorrectAnswer;

  void movePlayer(int diceRoll) {
    setState(() {
      if (currentPlayer == 1) {
        player1Position += diceRoll;
        if (player1Position >=100) player1Position =100; // If player reaches or exceeds position100
        player1Position = ladders[player1Position] ?? player1Position; // Check for ladders
        if (snakes.containsKey(player1Position)) {
          // If player lands on a snake
          player1Position = snakes[player1Position]!;
        }
        currentPlayer = widget.isMultiplayer ? (currentPlayer == 1 ?2 :1) :2; // Switch players
      } else {
        player2Position += diceRoll;
        if (player2Position >=100) player2Position =100; // If player reaches or exceeds position100
        player2Position = ladders[player2Position] ?? player2Position; // Check for ladders
        if (snakes.containsKey(player2Position)) {
          // If player lands on a snake
          player2Position = snakes[player2Position]!;
        }
        currentPlayer =1; // Switch back to player one in computer mode
      }
    });
  }

  void rollDice() {
    int diceRoll = Random().nextInt(6) +1; // Roll dice between [1-6]
    movePlayer(diceRoll);
    if (currentPlayer ==2 && !widget.isMultiplayer) {
      Future.delayed(const Duration(seconds:2), () {
        rollDice(); // Computer rolls automatically after delay
      });
    }
  }

  void showQuestionDialog() {
    if (ladders.containsKey(currentPlayer == 1 ? player1Position : player2Position)) {
      showDialog(
        context: context,
        builder:(context) => AlertDialog(
          title: const Text("Quiz Question"),
          contentPadding: EdgeInsets.all(10),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children:[
              Text(questions[Random().nextInt(questions.length)].question),
              ...questions[Random().nextInt(questions.length)].options.map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue:selectedAnswer,
                  onChanged:(value){
                    setState(() {
                      selectedAnswer=value;
                      isCorrectAnswer= value == questions[Random().nextInt(questions.length)].correctAnswer;
                    });
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ],
          ),
          actions:<Widget>[
            TextButton(onPressed:(() => Navigator.pop(context)), child :const Text("Cancel")),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title :const Text('Game Board')),
      body :Column(
        children :[
          Expanded(
            child : Padding(
              padding : const EdgeInsets.all(16.0),
              child : GridView.builder(
                gridDelegate : const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount :10,
                  childAspectRatio :1.0,
                  crossAxisSpacing :4.0,
                  mainAxisSpacing :4.0,
                ),
                itemCount :100,
                itemBuilder :(BuildContext context , int index){
                  int position =100 - index;
                  Color cellColor = Colors.white;
                  if (player1Position == position || player2Position == position) {
                    cellColor = Colors.blue;
                  } else if (snakes.containsKey(position)) {
                    cellColor = Colors.red;
                  } else if (ladders.containsKey(position)) {
                    cellColor = Colors.green;
                  } else if ((position -1)%10 %2 ==0) {
                    cellColor = Colors.grey[300]!;
                  } else {
                    cellColor = Colors.white;
                  }
                  return Container(
                    decoration :BoxDecoration(
                      color :cellColor,
                      border :Border.all(color :Colors.black , width :1),
                    ),
                    child :Center(
                      child :Text(position.toString(), style :const TextStyle(fontSize :12)),
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment :MainAxisAlignment.center,
            children :[
              ElevatedButton(onPressed :rollDice , child : const Text('Roll Dice')),
              const SizedBox(width :16),
              ElevatedButton(onPressed :showQuestionDialog , child : const Text('Show Quiz')),
            ],
          ),
          if(player1Position==100 ||player2Position==100)
            AlertDialog(
              title :const Text("Game Over"),
              content :Text(player1Position==100 ? 'Player One Wins!' :'Player Two Wins!'),
              actions:<Widget>[
                TextButton(onPressed :( ) => Navigator.pop(context), child :const Text("Play Again")),
              ],
            )
        ],
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}