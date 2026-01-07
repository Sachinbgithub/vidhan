import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../video_player_page.dart';

class UnionPage extends StatelessWidget {
  final List<String> provisions = [
    "Equality",
    "Freedom",
    "Protection against Exploitation",
    "Freedom of Religion",
    "Cultural and Educational Protection",
    "Constitutional Remedies",
  ];

  final Map<String, String> provisionDescriptions = {
    "Equality": "The State shall not deny to any person equality before the law.",
    "Freedom": "Protection of certain rights regarding freedom of speech, etc.",
    "Protection against Exploitation": "Prohibition of traffic in human beings and forced labor.",
    "Freedom of Religion": "Freedom of conscience and free profession, practice, and propagation of religion.",
    "Cultural and Educational Protection": "Protection of interests of minorities.",
    "Constitutional Remedies": "Right to move the Supreme Court for enforcement of rights.",
  };

  final Map<String, List<String>> articles = {
    "Equality": [
      "Article 14: The State shall not deny to any person equality before the law.",
      "Article 15: Prohibition of discrimination on grounds of religion, race, caste, sex, or place of birth.",
      "Article 16: Equality of opportunity in matters of public employment."
    ],
    "Freedom": [
      "Article 19: Protection of certain rights regarding freedom of speech, etc.",
      "Article 20: Protection in respect of conviction for offenses.",
      "Article 21: Protection of life and personal liberty."
    ],
    "Protection against Exploitation": [
      "Article 23: Prohibition of traffic in human beings and forced labor.",
      "Article 24: Prohibition of employment of children in factories, etc."
    ],
    "Freedom of Religion": [
      "Article 25: Freedom of conscience and free profession, practice, and propagation of religion.",
      "Article 26: Freedom to manage religious affairs."
    ],
    "Cultural and Educational Protection": [
      "Article 29: Protection of interests of minorities.",
      "Article 30: Right of minorities to establish and administer educational institutions."
    ],
    "Constitutional Remedies": [
      "Article 32: Right to constitutional remedies."
    ],
  };

   UnionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Part III - Constitutional Provisions'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Fundamental Provisions',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ...provisions.map((provision) {
                return InfoCard(
                    provision: provision,
                    description: provisionDescriptions[provision]!,
                    articles: articles[provision]!);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String provision;
  final String description;
  final List<String> articles;

  const InfoCard(
      {super.key,
        required this.provision,
        required this.description,
        required this.articles});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
                provision: provision, description: description, articles: articles),
          ),
        );
      },
      child: Card(
        color: Colors.blue[800],
        elevation: 100,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          constraints: const BoxConstraints(
            minHeight: 100,
            maxHeight: 150, // Fixed height for uniformity
            minWidth: double.infinity, // Full width
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(provision,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
                overflow: TextOverflow.ellipsis, // Text overflow handling
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatefulWidget {
  final String provision;
  final String description;
  final List<String> articles;

  const DetailsPage(
      {super.key, required this.provision,
        required this.description,
        required this.articles});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  YoutubePlayerController? _controller;

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
        title: Text(widget.provision),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Articles under ${widget.provision}:",
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...widget.articles.map((subArticle) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        minHeight: 100,
                        maxHeight: 150, // Fixed height for uniformity
                        minWidth: double.infinity, // Full width
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subArticle,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                              'Simplified Explanation'),
                                          content: Text(
                                            'Here is a simplified explanation of $subArticle:\n\n'
                                                'Explanation goes here...',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text('AI'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const YoutubeVideoPlayer(
                                            videoId: '18Qy9EZrF9Y'),
                                      ),
                                    );
                                  },
                                  child: const Text('Watch'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/quiz');
                                  },
                                  child: const Text('Quiz'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Icon(Icons.voice_chat),
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




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// import '../video_player_page.dart';
//
// class UnionPage extends StatelessWidget {
//   final List<String> provisions = [
//     "Equality",
//     "Freedom",
//     "Protection against Exploitation",
//     "Freedom of Religion",
//     "Cultural and Educational Protection",
//     "Constitutional Remedies",
//   ];
//
//   final Map<String, String> provisionDescriptions = {
//     "Equality": "The State shall not deny to any person equality before the law.",
//     "Freedom": "Protection of certain rights regarding freedom of speech, etc.",
//     "Protection against Exploitation": "Prohibition of traffic in human beings and forced labor.",
//     "Freedom of Religion": "Freedom of conscience and free profession, practice, and propagation of religion.",
//     "Cultural and Educational Protection": "Protection of interests of minorities.",
//     "Constitutional Remedies": "Right to move the Supreme Court for enforcement of rights.",
//   };
//
//   final Map<String, List<String>> articles = {
//     "Equality": [
//       "Article 14: The State shall not deny to any person equality before the law.",
//       "Article 15: Prohibition of discrimination on grounds of religion, race, caste, sex, or place of birth.",
//       "Article 16: Equality of opportunity in matters of public employment."
//     ],
//     "Freedom": [
//       "Article 19: Protection of certain rights regarding freedom of speech, etc.",
//       "Article 20: Protection in respect of conviction for offenses.",
//       "Article 21: Protection of life and personal liberty."
//     ],
//     "Protection against Exploitation": [
//       "Article 23: Prohibition of traffic in human beings and forced labor.",
//       "Article 24: Prohibition of employment of children in factories, etc."
//     ],
//     "Freedom of Religion": [
//       "Article 25: Freedom of conscience and free profession, practice, and propagation of religion.",
//       "Article 26: Freedom to manage religious affairs."
//     ],
//     "Cultural and Educational Protection": [
//       "Article 29: Protection of interests of minorities.",
//       "Article 30: Right of minorities to establish and administer educational institutions."
//     ],
//     "Constitutional Remedies": [
//       "Article 32: Right to constitutional remedies."
//     ],
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Part III - Constitutional Provisions'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text('Fundamental Provisions',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               ...provisions.map((provision) {
//                 return InfoCard(
//                     provision: provision,
//                     description: provisionDescriptions[provision]!,
//                     articles: articles[provision]!);
//               }).toList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class InfoCard extends StatelessWidget {
//   final String provision;
//   final String description;
//   final List<String> articles;
//
//   InfoCard(
//       {Key? key,
//         required this.provision,
//         required this.description,
//         required this.articles})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DetailsPage(
//                 provision: provision, description: description, articles: articles),
//           ),
//         );
//       },
//       child: Card(
//         color: Colors.blue[800],
//         elevation: 100,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(provision,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold)),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: TextStyle(fontSize: 14, color: Colors.white70),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DetailsPage extends StatefulWidget {
//   final String provision;
//   final String description;
//   final List<String> articles;
//
//   DetailsPage(
//       {required this.provision,
//         required this.description,
//         required this.articles});
//
//   @override
//   State<DetailsPage> createState() => _DetailsPageState();
// }
//
// class _DetailsPageState extends State<DetailsPage> {
//   bool _isVideoVisible = false;
//   YoutubePlayerController? _controller;
//
//   void _showVideo(String videoId) {
//     setState(() {
//       _controller = YoutubePlayerController(
//         initialVideoId: videoId,
//         flags: YoutubePlayerFlags(
//           autoPlay: true,
//           mute: false,
//         ),
//       );
//       _isVideoVisible = true;
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.blue.shade50,
//         title: Text(widget.provision),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.5),
//                 spreadRadius: 2,
//                 blurRadius: 5,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: ListView(
//               children: [
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Text(
//                     "Articles under ${widget.provision}:",
//                     style: const TextStyle(
//                       fontSize: 24,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ...widget.articles.map((subArticle) => Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.blue[100],
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.3),
//                             spreadRadius: 1,
//                             blurRadius: 3,
//                             offset: const Offset(0, 1),
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               subArticle,
//                               style: const TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black54,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                           title: const Text(
//                                               'Simplified Explanation'),
//                                           content: Text(
//                                             'Here is a simplified explanation of $subArticle:\n\n'
//                                                 'Explanation goes here...',
//                                           ),
//                                           actions: [
//                                             TextButton(
//                                               onPressed: () {
//                                                 Navigator.of(context).pop();
//                                               },
//                                               child: const Text('Close'),
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: const Text('AI'),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => YoutubeVideoPlayer(
//                                             videoId: '18Qy9EZrF9Y'),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text('Watch'),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () {
//                                     Navigator.pushNamed(context, '/quiz');
//                                   },
//                                   child: const Text('Quiz'),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )).toList(),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.amberAccent,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 30, vertical: 15),
//                       textStyle: const TextStyle(fontSize: 18),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: Icon(Icons.voice_chat),
//                   ),
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// //
// // import '../video_player_page.dart'; // Add audioplayers dependency in pubspec.yaml
// //
// // class UnionPage extends StatelessWidget {
// //   final List<String> provisions = [
// //     "Article 52: The President of India",
// //     "Article 53: Executive Power",
// //     "Article 54: Election of President",
// //     "Article 55: Manner of Election of President",
// //     "Article 56: Term of Office of President",
// //     "Article 61: Procedure for Impeachment of President",
// //     "Article 62: Time of Holding Election to the Office of President",
// //     "Article 63: The Vice-President of India",
// //     "Article 64: The Vice-President to be ex officio Chairman of the Council of States",
// //     "Article 65: The Vice-President to act as President in certain cases",
// //   ];
// //
// //   final Map<String, String> provisionDescriptions = {
// //     "Article 52: The President of India": "There shall be a President of India.",
// //     "Article 53: Executive Power": "The executive power of the Union shall be vested in the President.",
// //     "Article 54: Election of President": "The President shall be elected by the members of an electoral college.",
// //     "Article 55: Manner of Election of President": "The manner of election of the President shall be as prescribed by law.",
// //     "Article 56: Term of Office of President": "The President shall hold office for a term of five years.",
// //     "Article 61: Procedure for Impeachment of President": "The President shall be removed from office by impeachment.",
// //     "Article 62: Time of Holding Election to the Office of President": "Elections to the office of President shall be held before the expiry of the term.",
// //     "Article 63: The Vice-President of India": "There shall be a Vice-President of India.",
// //     "Article 64: The Vice-President to be ex officio Chairman of the Council of States": "The Vice-President shall be the ex officio Chairman of the Rajya Sabha.",
// //     "Article 65: The Vice-President to act as President in certain cases": "The Vice-President shall act as President when the office is vacant.",
// //   };
// //
// //   // Articles and their descriptions
// //   final Map<String, List<String>> articles = {
// //     'The President': [
// //       'Article 52: There shall be a President of India.',
// //       'Article 53: The executive power shall be vested in the President.',
// //       'Article 54: The election process for the President.',
// //       'Article 55: Manner and procedure for election.',
// //       'Article 56: Term and conditions.',
// //       'Article 61: Procedure for impeachment.',
// //       'Article 62: Time for holding elections.',
// //       'Article 63: Provision for Vice-President.',
// //       'Article 64: Role as ex officio Chairman.',
// //       'Article 65: Acting as President when necessary.'
// //     ],
// //     // You can add more sections and articles here
// //   };
// //
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Part III - Fundamental Rights'),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               const Text('Fundamental Rights',
// //                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// //               const SizedBox(height: 10),
// //               ...provisions.map((right) {
// //                 return DutyCard(
// //                     right: right,
// //                     description: provisionDescriptions[right]!,
// //                     articles: articles[right]!);
// //               }).toList(),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class DutyCard extends StatelessWidget {
// //   final String right;
// //   final String description;
// //   final List<String> articles;
// //   // bool _isVideoVisible = false;
// //   // YoutubePlayerController? _controller;
// //
// //
// //   DutyCard(
// //       {Key? key,
// //         required this.right,
// //         required this.description,
// //         required this.articles})
// //       : super(key: key);
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: () {
// //         Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) => ArticleDetailPage(
// //                 article: right, description: description, articles: articles),
// //           ),
// //         );
// //       },
// //       child:
// //       // Container(
// //       //   decoration: BoxDecoration(
// //       //     color: Colors.amber,
// //       //     borderRadius: BorderRadius.circular(10),
// //       //
// //       //     boxShadow: [
// //       //     BoxShadow(
// //       //       color: Colors.black.withOpacity(0.9),
// //       //       spreadRadius: 5,
// //       //       blurRadius: 10,
// //       //       offset: const Offset(5, 5), // changes position of shadow
// //       //     ),
// //       //   ],
// //       //   ),
// //       //   child: Transform.rotate(
// //       //   angle: 00, // Adjust the angle as needed
// //       //   child: Card(
// //       //     color: Colors.amber,
// //       //     elevation: 0, // Remove default elevation
// //       //     margin: const EdgeInsets.symmetric(vertical: 8),
// //       //     shape: RoundedRectangleBorder(
// //       //       borderRadius: BorderRadius.circular(10),
// //       //     ),
// //       //     child: Padding(
// //       //       padding: const EdgeInsets.all(16),
// //       //       child: Column(
// //       //         crossAxisAlignment: CrossAxisAlignment.start,
// //       //         children: [
// //       //           Text(
// //       //             right,
// //       //             style: const TextStyle(
// //       //               color: Colors.white,
// //       //               fontSize: 18,
// //       //               fontWeight: FontWeight.bold,
// //       //             ),
// //       //           ),
// //       //           const SizedBox(height: 8),
// //       //           Text(
// //       //             description,
// //       //             style: const TextStyle(fontSize: 14, color: Colors.white70),
// //       //           ),
// //       //         ],
// //       //       ),
// //       //     ),
// //       //   ),
// //       // ),
// //       // )
// //       Card(
// //         // color: Colors.amber,
// //         color: Colors.blue[800],
// //         elevation: 100,
// //         margin: const EdgeInsets.symmetric(vertical: 8),
// //         child: Padding(
// //           padding: const EdgeInsets.all(16),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(right,
// //                   style: const TextStyle(
// //                       color: Colors.white,
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold)),
// //               const SizedBox(
// //                 width: double.infinity,
// //                 height: 8,
// //               ),
// //               Text(
// //                 description,
// //                 style: TextStyle(fontSize: 14, color: Colors.white70),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class ArticleDetailPage extends StatefulWidget {
// //   final String article;
// //   final String description;
// //   final List<String> articles;
// //
// //   ArticleDetailPage(
// //       {required this.article,
// //         required this.description,
// //         required this.articles});
// //
// //   @override
// //   State<ArticleDetailPage> createState() => _ArticleDetailPageState();
// // }
// //
// // class _ArticleDetailPageState extends State<ArticleDetailPage> {
// //   bool _isVideoVisible = false;
// //   YoutubePlayerController? _controller;
// // // Function to show the video
// //   void _showVideo(String videoId) {
// //
// //     setState(() {
// //       _controller = YoutubePlayerController(
// //         initialVideoId: videoId,
// //         flags: YoutubePlayerFlags(
// //           autoPlay: true,
// //           mute: false,
// //
// //         ),
// //       );
// //       _isVideoVisible = true;
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller?.dispose();
// //     super.dispose();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.blue.shade50,
// //       appBar: AppBar(
// //         backgroundColor: Colors.blue.shade50,
// //         title: Text(widget.article),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Container(
// //           decoration: BoxDecoration(
// //             color: Colors.blue, // Light grey background
// //             borderRadius: BorderRadius.circular(16),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: Colors.grey.withOpacity(0.5),
// //                 spreadRadius: 2,
// //                 blurRadius: 5,
// //                 offset: const Offset(0, 3), // changes position of shadow
// //               ),
// //             ],
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(20.0),
// //             child: ListView(
// //               children: [
// //                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                   Text(
// //                     "Articles under \n${widget.article} :",
// //                     style: const TextStyle(
// //                       fontSize: 24,
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   ...widget.articles
// //                       .map((subArticle) => Padding(
// //                     padding: const EdgeInsets.symmetric(vertical: 8.0),
// //                     child: Container(
// //                       decoration: BoxDecoration(
// //                         color: Colors.blue[100],
// //                         borderRadius: BorderRadius.circular(8),
// //                         boxShadow: [
// //                           BoxShadow(
// //                             color: Colors.grey.withOpacity(0.3),
// //                             spreadRadius: 1,
// //                             blurRadius: 3,
// //                             offset: const Offset(0, 1),
// //                           ),
// //                         ],
// //                       ),
// //                       child: Padding(
// //                         padding: const EdgeInsets.all(16.0),
// //                         child: Column(
// //                           // Changed to Column to include buttons
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               subArticle,
// //                               style: const TextStyle(
// //                                   fontSize: 16,
// //                                   color: Colors.black54,
// //                                   fontWeight: FontWeight.bold),
// //                             ),
// //                             const SizedBox(height: 10),
// //                             // Space between text and buttons
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment
// //                                   .spaceBetween, // Space out buttons
// //                               children: [
// //                                 ElevatedButton(
// //                                   onPressed: () {
// //                                     showDialog(
// //                                       context: context,
// //                                       builder: (BuildContext context) {
// //                                         return AlertDialog(
// //                                           title: const Text(
// //                                               'Simplified Explanation'),
// //                                           content: Text(
// //                                             'Here isa simplified explanation of $subArticle:\n\n'
// //                                             // Add your logic to generate a simplified explanation here
// //                                                 ' This means that every individual, regardless of their caste, creed, race, sex, place of birth, or religion, is treated equally and has equal rights and opportunities. The state cannot deny equality to anyone, and all citizens are entitled to equal protection under the law, promoting fairness andjustice.',
// //                                           ),
// //                                           actions: [
// //                                             TextButton(
// //                                               onPressed: () {
// //                                                 Navigator.of(context)
// //                                                     .pop();
// //                                               },
// //                                               child:
// //                                               const Text('Close'),
// //                                             ),
// //                                           ],
// //                                         );
// //                                       },
// //                                     );
// //                                   },
// //                                   // Handle Read More action
// //                                   // print('Read More tapped for $subArticle');
// //                                   child: const Text('AI'),
// //                                 ),
// //                                 ElevatedButton(
// //                                   onPressed:
// //                                       () {
// //                                     // _showVideo('18Qy9EZrF9Y');
// //                                     Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                         builder: (context) => YoutubeVideoPlayer(
// //                                             videoId:'18Qy9EZrF9Y'), // Replace with your video ID
// //                                       ),
// //                                     );
// //
// //
// //
// //                                   },
// //                                   child: const Text('Watch'),
// //                                 ),
// //                                 // if (_isVideoVisible && _controller != null)
// //                                 //   SizedBox(
// //                                 //     width: 300, // Set your desired width here
// //                                 //     height: 200, // Set your desired height here
// //                                 //     child: YoutubePlayer(
// //                                 //       controller: _controller!,
// //                                 //       showVideoProgressIndicator: true,
// //                                 //       onReady: () {
// //                                 //         print('Player is ready.');
// //                                 //       },
// //                                 //     ), ),
// //                                 ElevatedButton(
// //                                   onPressed: () {
// //                                     Navigator.push(
// //                                         context,
// //                                         Navigator.pushNamed(context, '/quize')
// //                                         as Route<Object?>);
// //                                     // Handle Bookmark action
// //                                     print(
// //                                         'Bookmark tapped for $subArticle');
// //                                   },
// //                                   child: const Text('Quiz'),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ))
// //                       .toList(),
// //                   const SizedBox(height: 20),
// //                   ElevatedButton(
// //                     onPressed: () {},
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: Colors.amberAccent,
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 30, vertical: 15),
// //                       textStyle: const TextStyle(fontSize: 18),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10),
// //                       ),
// //                     ),
// //                     child: Icon(Icons.voice_chat),
// //                   ),
// //                 ]),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Union of India'),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               const Text('Provisions of Part V', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // //               const SizedBox(height: 10),
// // //               ...provisions.map((provision) {
// // //                 return DutyCard(provision: provision, description: provisionDescriptions[provision]!);
// // //               }).toList(),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class DutyCard extends StatelessWidget {
// // //   final String provision;
// // //   final String description;
// // //
// // //   const DutyCard({Key? key, required this.provision, required this.description}) : super(key: key);
// //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         Navigator.push(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (context) => ArticleDetailPage(article: provision, description: description),
// // //           ),
// // //         );
// // //       },
// // //       child: Card(
// // //
// // //         elevation: 4,
// // //         color: Colors.amber,
// // //         margin: const EdgeInsets.symmetric(vertical: 8),
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(provision, style: const TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold)),
// // //               const SizedBox(height: 8),
// // //               Text(description, style: const TextStyle(fontSize: 14, color: Colors.white70)),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // class ArticleDetailPage extends StatelessWidget {
// // //   final String article;
// // //   final String description;
// // //
// // //   final AudioPlayer audioPlayer = AudioPlayer();
// // //
// // //   ArticleDetailPage({required this.article, required this.description});
// // //
// // //   void _playAudio() async {
// // //     // Replace with your audio file path
// // //     await audioPlayer.play(AssetSource('audio/$article.mp3'));
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar:
// // //       AppBar(title :Text(article)),
// // //       body :Padding(
// // //         padding :const EdgeInsets.all(16.0),
// // //         child :Container(
// // //           decoration :BoxDecoration(
// // //             color :Colors.amber, // Light amber background
// // //             borderRadius :BorderRadius.circular(16),
// // //             boxShadow :[
// // //               BoxShadow(
// // //                 color :Colors.grey.withOpacity(0.5),
// // //                 spreadRadius :2,
// // //                 blurRadius :5,
// // //                 offset :const Offset(0,3), // changes position of shadow
// // //               ),
// // //             ],
// // //           ),
// // //           child :Padding(
// // //             padding :const EdgeInsets.all(20.0),
// // //             child :Column(
// // //               crossAxisAlignment :CrossAxisAlignment.start,
// // //               children :[
// // //                 Text("Description of \n$article", style:
// // //                 const TextStyle(fontSize :24,
// // //                     color: Colors.white,
// // //                     fontWeight :FontWeight.bold)),
// // //                 const SizedBox(height :10),
// // //                 Text(description, style:
// // //                 const TextStyle(fontSize :16)),
// // //                 const SizedBox(height :20),
// // //                 const Text("Articles:", style:
// // //                 TextStyle(fontSize :
// // //                 20)),
// // //                 ...[article]?.map((subArticle) => Padding(
// // //                   padding :
// // //                   const EdgeInsets.symmetric(vertical :
// // //                   8.0),
// // //                   child :
// // //                   Container(
// // //                     decoration :
// // //                     BoxDecoration(
// // //                       color :
// // //                       Colors.amber[200],
// // //                       borderRadius :
// // //                       BorderRadius.circular(8),
// // //                       boxShadow:[
// // //                         BoxShadow(
// // //                           color :
// // //                           Colors.grey.withOpacity(0.3),
// // //                           spreadRadius :
// // //                           1,
// // //                           blurRadius :
// // //                           3,
// // //                           offset :
// // //                           const Offset(0,1),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     child :
// // //                     Padding(
// // //                       padding :
// // //                       const EdgeInsets.all(16.0),
// // //                       child :
// // //                       Text(subArticle,
// // //                         style :
// // //                         const TextStyle(fontSize :
// // //                         16,
// // //                             color :
// // //                             Colors.black54,
// // //                             fontWeight :
// // //                             FontWeight.bold),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 )).toList() ?? [],
// // //                 const SizedBox(height :20),
// // //                 ElevatedButton(
// // //                   onPressed :_playAudio,
// // //                   style :ElevatedButton.styleFrom(
// // //                     backgroundColor :Colors.amberAccent,
// // //                     padding :const EdgeInsets.symmetric(horizontal :30 , vertical :15),
// // //                     textStyle :const TextStyle(fontSize :18),
// // //                     shape :RoundedRectangleBorder(
// // //                       borderRadius :BorderRadius.circular(10),
// // //                     ),
// // //                   ),
// // //                   child :const Icon(Icons.voice_chat), // Changed button text to an icon
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }