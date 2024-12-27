import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../video_player_page.dart';

class RightsPage2 extends StatelessWidget {
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
  // bool _isVideoVisible = false;
  // YoutubePlayerController? _controller;

  DutyCard(
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
          Card(
        // color: Colors.amber,
        // color: Colors.blue[800],
        color: Color(0xFFACB3D5),
        elevation: 100,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(right,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  )),
              const SizedBox(
                width: double.infinity,
                height: 8,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatefulWidget {
  final String article;
  final String description;
  final List<String> articles;

  ArticleDetailPage(
      {required this.article,
      required this.description,
      required this.articles});

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  bool _isVideoVisible = false;
  YoutubePlayerController? _controller;
// Function to show the video
  void _showVideo(String videoId) {
    setState(() {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      );
      _isVideoVisible = true;
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text(widget.article),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            // color: Colors.blue, // Light grey background
            color: Color(0xFFACB3D5),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 10.0,
                blurRadius: 10.0,
                offset: const Offset(3.1, 2), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Articles under \n${widget.article} :",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...widget.articles
                      .map((subArticle) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 10,
                                    blurRadius: 3,
                                    offset: const Offset(3.5, 2),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  // Changed to Column to include buttons
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      subArticle,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    // Space between text and buttons
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween, // Space out buttons
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Simplified Explanation'),
                                                  content:
                                                  // ArticleDetailPage(article: '', description: '', articles: [subArticle],),
                                                  Text(
                                                    'Here is a simplified explanation of $subArticle:\n\n'

                                                    // Add your logic to generate a simplified explanation here
                                                    ' This means that every individual, regardless of their caste, creed, race, sex, place of birth, or religion, is treated equally and has equal rights and opportunities. The state cannot deny equality to anyone, and all citizens are entitled to equal protection under the law, promoting fairness andjustice.',
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child:
                                                          const Text('Close'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          // Handle Read More action
                                          // print('Read More tapped for $subArticle');
                                          child: const Text('AI'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // _showVideo('18Qy9EZrF9Y');
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    YoutubeVideoPlayer(
                                                        videoId:
                                                            '18Qy9EZrF9Y'), // Replace with your video ID
                                              ),
                                            );
                                          },
                                          child: const Text('Watch'),
                                        ),
                                        // if (_isVideoVisible && _controller != null)
                                        //   SizedBox(
                                        //     width: 300, // Set your desired width here
                                        //     height: 200, // Set your desired height here
                                        //     child: YoutubePlayer(
                                        //       controller: _controller!,
                                        //       showVideoProgressIndicator: true,
                                        //       onReady: () {
                                        //         print('Player is ready.');
                                        //       },
                                        //     ), ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                Navigator.pushNamed(
                                                        context, '/quize')
                                                    as Route<Object?>);
                                            // Handle Bookmark action
                                            print(
                                                'Bookmark tapped for $subArticle');
                                          },
                                          child: const Text('Quiz'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          Navigator.pushNamed(
                              context, '/quiz_1')
                          as Route<Object?>);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(child: Text("Play Quize")),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
