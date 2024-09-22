import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Add audioplayers dependency in pubspec.yaml

class DutiesAndPrinciplesPage extends StatelessWidget {
  final List<String> duties = [
    "Duty to abide by the Constitution",
    "Duty to respect the National Flag",
    "Duty to uphold the sovereignty, unity and integrity of India",
    "Duty to defend the country",
    "Duty to promote harmony",
    "Duty to protect and improve the natural environment",
    "Duty to develop the scientific temper",
    "Duty to safeguard public property",
    "Duty to strive towards excellence",
  ];

  final List<String> principles = [
    "Principle of Social Justice",
    "Principle of Economic Justice",
    "Principle of Political Justice",
    "Principle of Equality",
    "Principle of Fraternity",
    "Principle of Secularism",
    "Principle of Welfare State",
  ];

  final Map<String, String> dutyDescriptions = {
    "Duty to abide by the Constitution":
        "To uphold and respect the Constitution and the laws made thereunder.",
    "Duty to respect the National Flag":
        "To show respect to the National Flag and the National Anthem.",
    "Duty to uphold the sovereignty, unity and integrity of India":
        "To safeguard the sovereignty, unity, and integrity of the nation.",
    "Duty to defend the country":
        "To defend the country and render national service when called upon.",
    "Duty to promote harmony":
        "To promote harmony and the spirit of common brotherhood amongst all the people.",
    "Duty to protect and improve the natural environment":
        "To protect and improve the natural environment including forests, lakes, rivers, and wildlife.",
    "Duty to develop the scientific temper":
        "To develop the scientific temper, humanism, and the spirit of inquiry and reform.",
    "Duty to safeguard public property":
        "To safeguard public property and to abjure violence.",
    "Duty to strive towards excellence":
        "To strive towards excellence in all spheres of individual and collective activity.",
  };

  final Map<String, String> principleDescriptions = {
    "Principle of Social Justice":
        "The State shall ensure social justice and equality for all citizens.",
    "Principle of Economic Justice":
        "The State shall strive to eliminate inequalities in income and wealth.",
    "Principle of Political Justice":
        "The State shall ensure political justice and equality of opportunity in public employment.",
    "Principle of Equality":
        "The State shall promote equality and ensure that no citizen is discriminated against.",
    "Principle of Fraternity":
        "The State shall promote fraternity among the people to maintain the dignity of the individual.",
    "Principle of Secularism":
        "The State shall not favor any religion and shall treat all religions equally.",
    "Principle of Welfare State":
        "The State shall strive to provide a decent standard of living for all its citizens.",
  };

  // Articles for Duties
  final Map<String, List<String>> dutyArticles = {
    "Duty to abide by the Constitution": [
      'Article 51A(a): To abide by the Constitution.',
      'Article 51A(b): To respect its ideals and institutions.',
      'Article 51A(c): To uphold and protect the sovereignty, unity, and integrity of India.',
      // Add more articles as needed
    ],
  };

  // Articles for Principles
  final Map<String, List<String>> principleArticles = {
    "Principle of Social Justice": [
      'Article 38: The State shall strive to promote social order.',
      'Article 39: The State shall direct its policy towards securing...',
      // Add more articles as needed
      'Article 41: The State shall make effective provision for securing...',
      'Article 42: The State shall make provision for securing just...',
      'Article 43: The State shall endeavor to secure for all workers...',
      'Article 44: The State shall endeavor to secure for all citizens...',
      'Article 45: The State shall endeavor to provide early childhood care...',
      'Article 46: The State shall promote with special care...',
      'Article 47: The State shall regard it as its primary duty...'
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part IV - Duties & Principles'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Fundamental Duties',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...duties.map((duty) {
                return DutyCard(
                    duty: duty,
                    description: dutyDescriptions[duty]!,
                    articles: dutyArticles[duty] ?? []);
              }).toList(),
              const SizedBox(height: 20),
              const Text('Directive Principles of State Policy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...principles.map((principle) {
                return DutyCard(
                    duty: principle,
                    description: principleDescriptions[principle]!,
                    articles: principleArticles[principle] ?? []);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class DutyCard extends StatelessWidget {
  final String duty;
  final String description;
  final List<String> articles;

  const DutyCard(
      {Key? key,
      required this.duty,
      required this.description,
      required this.articles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(
                article: duty, description: description, articles: articles),
          ),
        );
      },
      child: Card(
        color: Colors.amber,
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(duty,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(description,
                  style: const TextStyle(fontSize: 14, color: Colors.white70)),
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
  final List<String> articles;

  final AudioPlayer audioPlayer = AudioPlayer();

  ArticleDetailPage(
      {required this.article,
      required this.description,
      required this.articles});

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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber, // Light amber background
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Articles under \n$article :",
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                ...articles
                    .map((subArticle) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber[200],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                subArticle,
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _playAudio,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Icon(
                      Icons.voice_chat), // Changed button text to an icon
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
