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

  // Articles and their descriptions
  final Map<String, List<String>> articles = {
    'The President': [
      'Article 52: There shall be a President of India.',
      'Article 53: The executive power shall be vested in the President.',
      'Article 54: The election process for the President.',
      'Article 55: Manner and procedure for election.',
      'Article 56: Term and conditions.',
      'Article 61: Procedure for impeachment.',
      'Article 62: Time for holding elections.',
      'Article 63: Provision for Vice-President.',
      'Article 64: Role as ex officio Chairman.',
      'Article 65: Acting as President when necessary.'
    ],
    // You can add more sections and articles here
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
        color: Colors.amber,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(provision, style: const TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold)),
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
      appBar:
      AppBar(title :Text(article)),
      body :Padding(
        padding :const EdgeInsets.all(16.0),
        child :Container(
          decoration :BoxDecoration(
            color :Colors.amber, // Light amber background
            borderRadius :BorderRadius.circular(16),
            boxShadow :[
              BoxShadow(
                color :Colors.grey.withOpacity(0.5),
                spreadRadius :2,
                blurRadius :5,
                offset :const Offset(0,3), // changes position of shadow
              ),
            ],
          ),
          child :Padding(
            padding :const EdgeInsets.all(20.0),
            child :Column(
              crossAxisAlignment :CrossAxisAlignment.start,
              children :[
                Text("Description of \n$article", style:
                const TextStyle(fontSize :24,
                    color: Colors.white,
                    fontWeight :FontWeight.bold)),
                const SizedBox(height :10),
                Text(description, style:
                const TextStyle(fontSize :16)),
                const SizedBox(height :20),
                const Text("Articles:", style:
                TextStyle(fontSize :
                20)),
                ...[article]?.map((subArticle) => Padding(
                  padding :
                  const EdgeInsets.symmetric(vertical :
                  8.0),
                  child :
                  Container(
                    decoration :
                    BoxDecoration(
                      color :
                      Colors.amber[200],
                      borderRadius :
                      BorderRadius.circular(8),
                      boxShadow:[
                        BoxShadow(
                          color :
                          Colors.grey.withOpacity(0.3),
                          spreadRadius :
                          1,
                          blurRadius :
                          3,
                          offset :
                          const Offset(0,1),
                        ),
                      ],
                    ),
                    child :
                    Padding(
                      padding :
                      const EdgeInsets.all(16.0),
                      child :
                      Text(subArticle,
                        style :
                        const TextStyle(fontSize :
                        16,
                            color :
                            Colors.black54,
                            fontWeight :
                            FontWeight.bold),
                      ),
                    ),
                  ),
                )).toList() ?? [],
                const SizedBox(height :20),
                ElevatedButton(
                  onPressed :_playAudio,
                  style :ElevatedButton.styleFrom(
                    backgroundColor :Colors.amberAccent,
                    padding :const EdgeInsets.symmetric(horizontal :30 , vertical :15),
                    textStyle :const TextStyle(fontSize :18),
                    shape :RoundedRectangleBorder(
                      borderRadius :BorderRadius.circular(10),
                    ),
                  ),
                  child :const Icon(Icons.voice_chat), // Changed button text to an icon
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}