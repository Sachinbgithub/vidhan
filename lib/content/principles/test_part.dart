import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Add audioplayers dependency in pubspec.yaml

class Part3 extends StatelessWidget {
  final List<String> articles = [
    "Article 12: Definition of State",
    "Article 13: Laws inconsistent with or in derogation of the fundamental rights",
    "Article 14: Equality before law",
    "Article 15: Prohibition of discrimination on grounds of religion, race, caste, sex, or place of birth",
    "Article 16: Equality of opportunity in matters of public employment",
    "Article 17: Abolition of untouchability",
    "Article 18: Abolition of titles",
    "Article 19: Protection of certain rights regarding freedom of speech, etc.",
    "Article 20: Protection in respect of conviction for offences",
    "Article 21: Protection of life and personal liberty",
    "Article 21A: Right to education",
    "Article 22: Protection against arrest and detention in certain cases",
    "Article 23: Prohibition of traffic in human beings and forced labor",
    "Article 24: Prohibition of employment of children in factories, etc.",
    "Article 25: Freedom of conscience and free profession, practice, and propagation of religion",
    "Article 26: Freedom to manage religious affairs",
    "Article 27: Freedom as to payment of taxes for promotion of any particular religion",
    "Article 28: Freedom as to attendance at religious instruction or religious worship in certain educational institutions",
    "Article 29: Protection of interests of minorities",
    "Article 30: Right of minorities to establish and administer educational institutions",
    "Article 31: (Repealed)",
    "Article 32: Right to constitutional remedies",
    "Article 33: Power of Parliament to modify the rights conferred by this Part in their application to Forces, etc.",
    "Article 34: Restriction on rights conferred by this Part while martial law is in force in any area",
    "Article 35: Legislation to give effect to the provisions of this Part"
  ];

  final Map<String, String> articleDescriptions = {
    "Article 12: Definition of State":
    "Defines the term 'State' as used in Part III of the Constitution.",
    "Article 13: Laws inconsistent with or in derogation of the fundamental rights":
    "All laws that are inconsistent with or derogatory to fundamental rights are considered void.",
    "Article 14: Equality before law":
    "The State shall not deny to any person equality before the law or the equal protection of the laws.",
    "Article 15: Prohibition of discrimination on grounds of religion, race, caste, sex, or place of birth":
    "Prohibits discrimination by the State against any citizen on the grounds of religion, race, caste, sex, or place of birth.",
    "Article 16: Equality of opportunity in matters of public employment":
    "Guarantees equal opportunity to all citizens in matters related to employment or appointment to any office under the State.",
    "Article 17: Abolition of untouchability":
    "Untouchability is abolished and its practice in any form is forbidden.",
    "Article 18: Abolition of titles":
    "Prohibits the State from conferring any titles except military or academic distinctions.",
    "Article 19: Protection of certain rights regarding freedom of speech, etc.":
    "Protects the right to freedom of speech and expression, to assemble peaceably, to form associations, to move freely, etc.",
    "Article 20: Protection in respect of conviction for offences":
    "Provides protection against ex post facto laws, double jeopardy, and self-incrimination.",
    "Article 21: Protection of life and personal liberty":
    "No person shall be deprived of his life or personal liberty except according to procedure established by law.",
    "Article 21A: Right to education":
    "The State shall provide free and compulsory education to all children of the age of six to fourteen years.",
    "Article 22: Protection against arrest and detention in certain cases":
    "Lays down the rights of individuals who are arrested and detained.",
    "Article 23: Prohibition of traffic in human beings and forced labor":
    "Prohibits human trafficking and forced labor.",
    "Article 24: Prohibition of employment of children in factories, etc.":
    "Prohibits the employment of children below the age of fourteen years in factories and other hazardous conditions.",
    "Article 25: Freedom of conscience and free profession, practice, and propagation of religion":
    "Grants freedom to individuals to freely profess, practice, and propagate their religion.",
    "Article 26: Freedom to manage religious affairs":
    "Grants every religious denomination the right to manage its own affairs.",
    "Article 27: Freedom as to payment of taxes for promotion of any particular religion":
    "No person shall be compelled to pay taxes for the promotion of a particular religion.",
    "Article 28: Freedom as to attendance at religious instruction or religious worship in certain educational institutions":
    "Provides for the freedom to not attend religious instruction or worship in educational institutions wholly funded by the State.",
    "Article 29: Protection of interests of minorities":
    "Provides protection to minorities in preserving their culture and language.",
    "Article 30: Right of minorities to establish and administer educational institutions":
    "Grants minorities the right to establish and administer educational institutions of their choice.",
    "Article 32: Right to constitutional remedies":
    "Gives individuals the right to approach the Supreme Court to seek enforcement of fundamental rights.",
    "Article 33: Power of Parliament to modify the rights conferred by this Part in their application to Forces, etc.":
    "Parliament can restrict or modify the application of fundamental rights to the armed forces and other forces.",
    "Article 34: Restriction on rights conferred by this Part while martial law is in force in any area":
    "Provides for the restriction of fundamental rights when martial law is declared.",
    "Article 35: Legislation to give effect to the provisions of this Part":
    "Empowers Parliament to make laws for enforcing the provisions of fundamental rights."
  };

  Part3({super.key});

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
              const Text('Fundamental Rights',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...articles.map((right) {
                return DutyCard(
                    right: right, description: articleDescriptions[right]!);
              })
                  // .toList(),
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

  const DutyCard({super.key, required this.right, required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ArticleDetailPage(article: right, description: description),
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
              Text(right, style: const TextStyle(color: Colors.white,
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
  final AudioPlayer audioPlayer = AudioPlayer();

  ArticleDetailPage({super.key, required this.article, required this.description});

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
            Text("Description of $article", style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _playAudio,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                // Text color
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
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
