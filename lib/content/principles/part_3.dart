import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Add audioplayers dependency in pubspec.yaml

class RightsPage extends StatelessWidget {
  final List<String> rights = [
    "Right to Equality",
    "Right to Freedom",
    "Right against Exploitation",
    "Right to Freedom of Religion",
    "Cultural and Educational Rights",
    "Right to Constitutional Remedies",
  ];

  final Map<String, String> rightDescriptions = {
    "Right to Equality": "The State shall not deny to any person equality before the law.",
    "Right to Freedom": "Protection of certain rights regarding freedom of speech, etc.",
    "Right against Exploitation": "Prohibition of traffic in human beings and forced labor.",
    "Right to Freedom of Religion": "Freedom of conscience and free profession, practice, and propagation of religion.",
    "Cultural and Educational Rights": "Protection of interests of minorities.",
    "Right to Constitutional Remedies": "Right to move the Supreme Court for enforcement of rights.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part III'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Fundamental Rights', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...rights.map((right) {
                return DutyCard(right: right, description: rightDescriptions[right]!);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class DutyCard extends StatelessWidget {
  final String right;
  final String description;

  const DutyCard({Key? key, required this.right, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: right, description: description),
          ),
        );
      },
      child: Card(
        color: Colors.teal.shade300,
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(right, style: const TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description, style: const TextStyle(fontSize: 14, color: Colors.white70)),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatelessWidget {
  final String article;
  final String description;
  final AudioPlayer audioPlayer = AudioPlayer();

  ArticleDetailPage({required this.article, required this.description});

  void _playAudio() async {
    // Replace with your audio file path
    await audioPlayer.play(AssetSource('audio/$article.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description of $article", style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playAudio,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
              child: const Text("Listen to Article"),
            ),
          ],
        ),
      ),
    );
  }
}