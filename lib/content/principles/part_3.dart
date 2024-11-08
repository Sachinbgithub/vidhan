import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    "Right to Equality":
        "The State shall not deny to any person equality before the law.",
    "Right to Freedom":
        "Protection of certain rights regarding freedom of speech, etc.",
    "Right against Exploitation":
        "Prohibition of traffic in human beings and forced labor.",
    "Right to Freedom of Religion":
        "Freedom of conscience and free profession, practice, and propagation of religion.",
    "Cultural and Educational Rights": "Protection of interests of minorities.",
    "Right to Constitutional Remedies":
        "Right to move the Supreme Court for enforcement of rights.",
  };

  final Map<String, List<String>> articles = {
    "Right to Equality": [
      "Article 14: The State shall not deny to any person equality before the law.",
      "Article 15: Prohibition of discrimination on grounds of religion, race, caste, sex or place of birth.",
      "Article 16: Equality of opportunity in matters of public employment."
    ],
    "Right to Freedom": [
      "Article 19: Protection of certain rights regarding freedom of speech, etc.",
      "Article 20: Protection in respect of conviction for offenses.",
      "Article 21: Protection of life and personal liberty."
    ],
    "Right against Exploitation": [
      "Article 23: Prohibition of traffic in human beings and forced labor.",
      "Article 24: Prohibition of employment of children in factories, etc."
    ],
    "Right to Freedom of Religion": [
      "Article 25: Freedom of conscience and free profession, practice and propagation of religion.",
      "Article 26: Freedom to manage religious affairs."
    ],
    "Cultural and Educational Rights": [
      "Article 29: Protection of interests of minorities.",
      "Article 30: Right of minorities to establish and administer educational institutions."
    ],
    "Right to Constitutional Remedies": [
      "Article 32: Right to constitutional remedies."
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part III - Fundamental Rights'),
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
              ...rights.map((right) {
                return DutyCard(
                    right: right,
                    description: rightDescriptions[right]!,
                    articles: articles[right]!);
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
  final List<String> articles;

  const DutyCard(
      {Key? key,
      required this.right,
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
                article: right, description: description, articles: articles),
          ),
        );
      },
      child:
        // Container(
        //   decoration: BoxDecoration(
        //     color: Colors.amber,
        //     borderRadius: BorderRadius.circular(10),
        //
        //     boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.9),
        //       spreadRadius: 5,
        //       blurRadius: 10,
        //       offset: const Offset(5, 5), // changes position of shadow
        //     ),
        //   ],
        //   ),
        //   child: Transform.rotate(
        //   angle: 00, // Adjust the angle as needed
        //   child: Card(
        //     color: Colors.amber,
        //     elevation: 0, // Remove default elevation
        //     margin: const EdgeInsets.symmetric(vertical: 8),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Padding(
        //       padding: const EdgeInsets.all(16),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             right,
        //             style: const TextStyle(
        //               color: Colors.white,
        //               fontSize: 18,
        //               fontWeight: FontWeight.bold,
        //             ),
        //           ),
        //           const SizedBox(height: 8),
        //           Text(
        //             description,
        //             style: const TextStyle(fontSize: 14, color: Colors.white70),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // )
      Card(
        color: Colors.amber,
        elevation: 100,
        shadowColor: Colors.black38,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(right,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
               SizedBox(height: 8, width: double.infinity,),
              Text(description,
                  style:  TextStyle(fontSize: 14, color: Colors.white70),
              ),],
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

  ArticleDetailPage(
      {required this.article,
      required this.description,
      required this.articles});

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
            color: Colors.amber, // Light grey background
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius:5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Articles under \n$article :",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ...articles.map((subArticle) => Padding(
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
                        style: const TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ))
                    .toList(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Icon(Icons.voice_chat),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
