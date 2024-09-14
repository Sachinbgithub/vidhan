import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Add audioplayers dependency in pubspec.yaml


class UnionPage extends StatelessWidget {
  final List<String> provisions = [
    "Article 52: The President of India",
    "Article 53: Executive Power",
    "Article 54: Election of President",
    "Article 55: Manner of Election of President",
    "Article 56: Term of Office of President",
    "Article 61: Procedure for Impeachment of President",
    "Article 62: Time of Holding Election to the Office of President",
    "Article 63: The Vice-President of India",
    "Article 64: The Vice-President to be ex officio Chairman of the Council of States",
    "Article 65: The Vice-President to act as President in certain cases",
  ];

  final Map<String, String> provisionDescriptions = {
    "Article 52: The President of India": "There shall be a President of India.",
    "Article 53: Executive Power": "The executive power of the Union shall be vested in the President.",
    "Article 54: Election of President": "The President shall be elected by the members of an electoral college.",
    "Article 55: Manner of Election of President": "The manner of election of the President shall be as prescribed by law.",
    "Article 56: Term of Office of President": "The President shall hold office for a term of five years.",
    "Article 61: Procedure for Impeachment of President": "The President shall be removed from office by impeachment.",
    "Article 62: Time of Holding Election to the Office of President": "Elections to the office of President shall be held before the expiry of the term.",
    "Article 63: The Vice-President of India": "There shall be a Vice-President of India.",
    "Article 64: The Vice-President to be ex officio Chairman of the Council of States": "The Vice-President shall be the ex officio Chairman of the Rajya Sabha.",
    "Article 65: The Vice-President to act as President in certain cases": "The Vice-President shall act as President when the office is vacant.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Union of India'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Provisions of Part V', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...provisions.map((provision) {
                return DutyCard(provision: provision, description: provisionDescriptions[provision]!);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class DutyCard extends StatelessWidget {
  final String provision;
  final String description;

  const DutyCard({Key? key, required this.provision, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(article: provision, description: description),
          ),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(provision, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
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
              child: const Text("Listen to Article"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // Text color
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}