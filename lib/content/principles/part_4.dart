import 'package:flutter/material.dart';

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

  final Map<String, List<String>> dutyArticles = {
    "Duty to abide by the Constitution": [
      'Article 51A(a): To abide by the Constitution.',
      'Article 51A(b): To respect its ideals and institutions.',
      'Article 51A(c): To uphold and protect the sovereignty, unity, and integrity of India.',
    ],
    // Add more articles as necessary
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fundamental Duties'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fundamental Duties',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...duties.map((duty) {
                return DutyCard(
                  duty: duty,
                  description: dutyDescriptions[duty] ?? '',
                  articles: dutyArticles[duty] ?? [],
                );
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

  DutyCard({
    required this.duty,
    required this.description,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DutyDetailsPage(
              duty: duty,
              description: description,
              articles: articles,
            ),
          ),
        );
      },
      child: Card(
        color: Color(0xFFACB3D5),
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Container(
          constraints: const BoxConstraints(
            // minHeight: 100,
            // maxHeight: 150,
            minWidth: double.infinity,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 3,
                offset: const Offset(3, 3),
              )
            ]
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                duty,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: const TextStyle(fontSize: 14, color: Colors.black45),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DutyDetailsPage extends StatelessWidget {
  final String duty;
  final String description;
  final List<String> articles;

  DutyDetailsPage({
    required this.duty,
    required this.description,
    required this.articles,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade50,
        title: Text(duty),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFACB3D5),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 3,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Text(
                  "Details of Duty: $duty",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  description,
                  style: const TextStyle(fontSize: 18, color: Colors.black45),
                ),
                const SizedBox(height: 20),
                ...articles.map((article) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    constraints: const BoxConstraints(
                      minHeight: 100,
                      maxHeight: 150,
                      minWidth: double.infinity,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
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
                                        title: const Text('Simplified Explanation'),
                                        content: Text(
                                          'Here is a simplified explanation of $article:\n\nExplanation goes here...',
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
                                child: const Text('Explain'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Articles'),
                                        content: Text(
                                          articles.join('\n'),
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
                                child: const Text('Articles'),
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
                )).toList(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
//
// class DutiesAndPrinciplesPage extends StatelessWidget {
//   final List<String> duties = [
//     "Duty to abide by the Constitution",
//     "Duty to respect the National Flag",
//     "Duty to uphold the sovereignty, unity and integrity of India",
//     "Duty to defend the country",
//     "Duty to promote harmony",
//     "Duty to protect and improve the natural environment",
//     "Duty to develop the scientific temper",
//     "Duty to safeguard public property",
//     "Duty to strive towards excellence",
//   ];
//
//   final Map<String, String> dutyDescriptions = {
//     "Duty to abide by the Constitution":
//     "To uphold and respect the Constitution and the laws made thereunder.",
//     "Duty to respect the National Flag":
//     "To show respect to the National Flag and the National Anthem.",
//     "Duty to uphold the sovereignty, unity and integrity of India":
//     "To safeguard the sovereignty, unity, and integrity of the nation.",
//     "Duty to defend the country":
//     "To defend the country and render national service when called upon.",
//     "Duty to promote harmony":
//     "To promote harmony and the spirit of common brotherhood amongst all the people.",
//     "Duty to protect and improve the natural environment":
//     "To protect and improve the natural environment including forests, lakes, rivers, and wildlife.",
//     "Duty to develop the scientific temper":
//     "To develop the scientific temper, humanism, and the spirit of inquiry and reform.",
//     "Duty to safeguard public property":
//     "To safeguard public property and to abjure violence.",
//     "Duty to strive towards excellence":
//     "To strive towards excellence in all spheres of individual and collective activity.",
//   };
//
//   final Map<String, List<String>> dutyArticles = {
//     "Duty to abide by the Constitution": [
//       'Article 51A(a): To abide by the Constitution.',
//       'Article 51A(b): To respect its ideals and institutions.',
//       'Article 51A(c): To uphold and protect the sovereignty, unity, and integrity of India.',
//     ],
//     // Add more articles as necessary
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fundamental Duties'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Fundamental Duties',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               ...duties.map((duty) {
//                 return DutyCard(
//                   duty: duty,
//                   description: dutyDescriptions[duty] ?? '',
//                   articles: dutyArticles[duty] ?? [],
//                 );
//               }).toList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DutyCard extends StatelessWidget {
//   final String duty;
//   final String description;
//   final List<String> articles;
//
//   DutyCard({
//     required this.duty,
//     required this.description,
//     required this.articles,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => DutyDetailsPage(
//               duty: duty,
//               description: description,
//               articles: articles,
//             ),
//           ),
//         );
//       },
//       child: Card(
//         color: Colors.green[700],
//         elevation: 4,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: Container(
//           constraints: const BoxConstraints(
//             minHeight: 100,
//             maxHeight: 150, // Fixed height for uniformity
//             minWidth: double.infinity,
//           ),
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 duty,
//                 style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: const TextStyle(fontSize: 14, color: Colors.white70),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 3,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DutyDetailsPage extends StatelessWidget {
//   final String duty;
//   final String description;
//   final List<String> articles;
//
//   DutyDetailsPage({
//     required this.duty,
//     required this.description,
//     required this.articles,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green.shade50,
//       appBar: AppBar(
//         backgroundColor: Colors.green.shade50,
//         title: Text(duty),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.green,
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
//                 Text(
//                   "Details of Duty: $duty",
//                   style: const TextStyle(
//                     fontSize: 24,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ...articles.map((article) => Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Container(
//                     constraints: const BoxConstraints(
//                       minHeight: 100,
//                       maxHeight: 150, // Fixed height for uniformity
//                       minWidth: double.infinity,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.green[100],
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.3),
//                           spreadRadius: 1,
//                           blurRadius: 3,
//                           offset: const Offset(0, 1),
//                         ),
//                       ],
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             article,
//                             style: const TextStyle(
//                               fontSize: 16,
//                               color: Colors.black54,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                             maxLines: 2,
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                         title: const Text('Simplified Explanation'),
//                                         content: Text(
//                                           'Here is a simplified explanation of $article:\n\nExplanation goes here...',
//                                         ),
//                                         actions: [
//                                           TextButton(
//                                             onPressed: () {
//                                               Navigator.of(context).pop();
//                                             },
//                                             child: const Text('Close'),
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: const Text('Explain'),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, '/quiz');
//                                 },
//                                 child: const Text('Quiz'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )).toList(),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// import '../video_player_page.dart';
//
// class DutiesAndPrinciplesPage extends StatelessWidget {
//   final List<String> duties = [
//     "Duty to abide by the Constitution",
//     "Duty to respect the National Flag",
//     "Duty to uphold the sovereignty, unity and integrity of India",
//     "Duty to defend the country",
//     "Duty to promote harmony",
//     "Duty to protect and improve the natural environment",
//     "Duty to develop the scientific temper",
//     "Duty to safeguard public property",
//     "Duty to strive towards excellence",
//   ];
//
//   final Map<String, String> dutyDescriptions = {
//     "Duty to abide by the Constitution":
//     "To uphold and respect the Constitution and the laws made thereunder.",
//     "Duty to respect the National Flag":
//     "To show respect to the National Flag and the National Anthem.",
//     "Duty to uphold the sovereignty, unity and integrity of India":
//     "To safeguard the sovereignty, unity, and integrity of the nation.",
//     "Duty to defend the country":
//     "To defend the country and render national service when called upon.",
//     "Duty to promote harmony":
//     "To promote harmony and the spirit of common brotherhood amongst all the people.",
//     "Duty to protect and improve the natural environment":
//     "To protect and improve the natural environment including forests, lakes, rivers, and wildlife.",
//     "Duty to develop the scientific temper":
//     "To develop the scientific temper, humanism, and the spirit of inquiry and reform.",
//     "Duty to safeguard public property":
//     "To safeguard public property and to abjure violence.",
//     "Duty to strive towards excellence":
//     "To strive towards excellence in all spheres of individual and collective activity.",
//   };
//
//   final Map<String, List<String>> dutyArticles = {
//     "Duty to abide by the Constitution": [
//       'Article 51A(a): To abide by the Constitution.',
//       'Article 51A(b): To respect its ideals and institutions.',
//       'Article 51A(c): To uphold and protect the sovereignty, unity, and integrity of India.',
//     ],
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Part III - Fundamental Rights'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Fundamental Rights',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               ...duties.map((right) {
//                 return RightCard(
//                   right: right,
//                   description: dutyDescriptions[right]!,
//                   articles: dutyArticles[right] ?? [],
//                 );
//               }).toList(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class RightCard extends StatelessWidget {
//   final String right;
//   final String description;
//   final List<String> articles;
//
//   const RightCard({Key? key, required this.right, required this.description, required this.articles}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ArticleDetailPage(
//               article: right,
//               description: description,
//               articles: articles,
//             ),
//           ),
//         );
//       },
//       child: Card(
//         color: Colors.blue[800],
//         elevation: 8,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 right,
//                 style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: const TextStyle(fontSize: 14, color: Colors.white70),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// //
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:audioplayers/audioplayers.dart'; // Add audioplayers dependency in pubspec.yaml
// // //
//
// class ArticleDetailPage extends StatefulWidget {
//   final String article;
//   final String description;
//   final List<String> articles;
//
//   ArticleDetailPage({required this.article, required this.description, required this.articles});
//
//   @override
//   _ArticleDetailPageState createState() => _ArticleDetailPageState();
// }
//
// class _ArticleDetailPageState extends State<ArticleDetailPage> {
//   bool _isVideoVisible = false;
//   YoutubePlayerController? _controller;
//
//   get right => null;
//
//   void _showVideo(String videoId) {
//     setState(() {
//       _controller = YoutubePlayerController(
//         initialVideoId: videoId,
//         flags: YoutubePlayerFlags(autoPlay: true, mute: false),
//       );
//       _isVideoVisible = true;
//     });
//   }
//
//   void _showAIResponse() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("AI Response"),
//         content: const Text("This is an AI-generated explanation of the right."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _navigateToQuiz() {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => QuizPage(),
//       ),
//     );
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
//         title: Text(widget.article),
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
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Articles under ${widget.article} :",
//                   style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 20),
//                 ...widget.articles.map(
//                       (subArticle) => Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.lightBlueAccent,
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
//                         child: Text(
//                           subArticle,
//                           style: const TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // children: [
//                   //   ElevatedButton(
//                   //     onPressed: _showAIResponse,
//                   //     style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
//                   //     child: const Text("AI"),
//                   //   ),
//                   //   ElevatedButton(
//                   //     onPressed: () => _showVideo('YOUR_VIDEO_ID'), // Replace with your video ID
//                   //     style: ElevatedButton.styleFrom(backgroundColor: Colors.amberAccent),
//                   //     child: const Text("Watch"),
//                   //   ),
//                   //   ElevatedButton(
//                   //     onPressed: _navigateToQuiz,
//                   //     style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
//                   //     child: const Text("Quiz"),
//                   //   ),
//                   // ],
//
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: const Text(
//                                   'Simplified Explanation'),
//                               content: Text(
//                                 'Here isa simplified explanation of $right:\n\n'
//                                 // Add your logic to generate a simplified explanation here
//                                     ' This means that every individual, regardless of their caste, creed, race, sex, place of birth, or religion, is treated equally and has equal rights and opportunities. The state cannot deny equality to anyone, and all citizens are entitled to equal protection under the law, promoting fairness andjustice.',
//                               ),
//                               actions: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Navigator.of(context)
//                                         .pop();
//                                   },
//                                   child:
//                                   const Text('Close'),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                       // Handle Read More action
//                       // print('Read More tapped for $subArticle');
//                       child: const Text('AI'),
//                     ),
//                     ElevatedButton(
//                       onPressed:
//                           () {
//                         // _showVideo('18Qy9EZrF9Y');
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => YoutubeVideoPlayer(
//                                 videoId:'18Qy9EZrF9Y'), // Replace with your video ID
//                           ),
//                         );
//
//
//
//                       },
//                       child: const Text('Watch'),
//                     ),
//                     // if (_isVideoVisible && _controller != null)
//                     //   SizedBox(
//                     //     width: 300, // Set your desired width here
//                     //     height: 200, // Set your desired height here
//                     //     child: YoutubePlayer(
//                     //       controller: _controller!,
//                     //       showVideoProgressIndicator: true,
//                     //       onReady: () {
//                     //         print('Player is ready.');
//                     //       },
//                     //     ), ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             Navigator.pushNamed(context, '/quize')
//                             as Route<Object?>);
//                         // Handle Bookmark action
//                         print(
//                             'Bookmark tapped for $right');
//                       },
//                       child: const Text('Quiz'),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 if (_isVideoVisible && _controller != null)
//                   YoutubePlayer(
//                     controller: _controller!,
//                     showVideoProgressIndicator: true,
//                     onReady: () {
//                       print('Player is ready.');
//                     },
//                   ),
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
// class QuizPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Quiz"),
//       ),
//       body: Center(
//         child: const Text("Quiz questions will go here."),
//       ),
//     );
//   }
// }
// // // class DutiesAndPrinciplesPage extends StatelessWidget {
// // //   final List<String> duties = [
// // //     "Duty to abide by the Constitution",
// // //     "Duty to respect the National Flag",
// // //     "Duty to uphold the sovereignty, unity and integrity of India",
// // //     "Duty to defend the country",
// // //     "Duty to promote harmony",
// // //     "Duty to protect and improve the natural environment",
// // //     "Duty to develop the scientific temper",
// // //     "Duty to safeguard public property",
// // //     "Duty to strive towards excellence",
// // //   ];
// // //
// // //   final Map<String, String> dutyDescriptions = {
// // //     "Duty to abide by the Constitution":
// // //     "To uphold and respect the Constitution and the laws made thereunder.",
// // //     "Duty to respect the National Flag":
// // //     "To show respect to the National Flag and the National Anthem.",
// // //     "Duty to uphold the sovereignty, unity and integrity of India":
// // //     "To safeguard the sovereignty, unity, and integrity of the nation.",
// // //     "Duty to defend the country":
// // //     "To defend the country and render national service when called upon.",
// // //     "Duty to promote harmony":
// // //     "To promote harmony and the spirit of common brotherhood amongst all the people.",
// // //     "Duty to protect and improve the natural environment":
// // //     "To protect and improve the natural environment including forests, lakes, rivers, and wildlife.",
// // //     "Duty to develop the scientific temper":
// // //     "To develop the scientific temper, humanism, and the spirit of inquiry and reform.",
// // //     "Duty to safeguard public property":
// // //     "To safeguard public property and to abjure violence.",
// // //     "Duty to strive towards excellence":
// // //     "To strive towards excellence in all spheres of individual and collective activity.",
// // //   };
// // //
// // //   final Map<String, List<String>> dutyArticles = {
// // //     "Duty to abide by the Constitution": [
// // //       'Article 51A(a): To abide by the Constitution.',
// // //       'Article 51A(b): To respect its ideals and institutions.',
// // //       'Article 51A(c): To uphold and protect the sovereignty, unity, and integrity of India.',
// // //     ],
// // //   };
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Part IV - Duties & Principles'),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               const Text('Fundamental Duties',
// // //                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
// // //               const SizedBox(height: 10),
// // //               ...duties.map((duty) {
// // //                 return DutyCard(
// // //                     duty: duty,
// // //                     description: dutyDescriptions[duty]!,
// // //                     articles: dutyArticles[duty] ?? []);
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
// // //   final String duty;
// // //   final String description;
// // //   final List<String> articles;
// // //
// // //   const DutyCard(
// // //       {Key? key,
// // //         required this.duty,
// // //         required this.description,
// // //         required this.articles})
// // //       : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return GestureDetector(
// // //       onTap: () {
// // //         Navigator.push(
// // //           context,
// // //           MaterialPageRoute(
// // //             builder: (context) => ArticleDetailPage(
// // //                 article: duty, description: description, articles: articles),
// // //           ),
// // //         );
// // //       },
// // //       child: Card(
// // //         color: Colors.blue,
// // //         elevation: 100,
// // //         shadowColor: Colors.black38,
// // //         margin: const EdgeInsets.symmetric(vertical: 8),
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Text(duty,
// // //                   style: const TextStyle(
// // //                       color: Colors.white,
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.bold)),
// // //               const SizedBox(height: 8),
// // //               Text(
// // //                 description,
// // //                 style: const TextStyle(fontSize: 14, color: Colors.white70),
// // //               ),
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
// // //   final List<String> articles;
// // //   final AudioPlayer audioPlayer = AudioPlayer();
// // //
// // //   ArticleDetailPage(
// // //       {required this.article, required this.description, required this.articles});
// // //
// // //   void _playAudio() async {
// // //     await audioPlayer.play(AssetSource('audio/$article.mp3'));
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(article),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Container(
// // //           decoration: BoxDecoration(
// // //             color: Colors.blue, // Updated container color to blue
// // //             borderRadius: BorderRadius.circular(16),
// // //             boxShadow: [
// // //               BoxShadow(
// // //                 color: Colors.grey.withOpacity(0.5),
// // //                 spreadRadius: 2,
// // //                 blurRadius: 5,
// // //                 offset: const Offset(0, 3),
// // //               ),
// // //             ],
// // //           ),
// // //           child: Padding(
// // //             padding: const EdgeInsets.all(20.0),
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text("Articles under \n$article :",
// // //                     style: const TextStyle(
// // //                         fontSize: 24,
// // //                         color: Colors.white,
// // //                         fontWeight: FontWeight.bold)),
// // //                 const SizedBox(height: 20),
// // //                 ...articles.map((subArticle) => Padding(
// // //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
// // //                   child: Container(
// // //                     decoration: BoxDecoration(
// // //                       color: Colors.lightBlueAccent, // Updated inner container color to light blue
// // //                       borderRadius: BorderRadius.circular(8),
// // //                       boxShadow: [
// // //                         BoxShadow(
// // //                           color: Colors.grey.withOpacity(0.3),
// // //                           spreadRadius: 1,
// // //                           blurRadius: 3,
// // //                           offset: const Offset(0, 1),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     child: Padding(
// // //                       padding: const EdgeInsets.all(16.0),
// // //                       child: Text(
// // //                         subArticle,
// // //                         style: const TextStyle(
// // //                             fontSize: 16,
// // //                             color: Colors.black54,
// // //                             fontWeight: FontWeight.bold),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ))
// // //                     .toList(),
// // //                 const SizedBox(height: 20),
// // //                 ElevatedButton(
// // //                   onPressed: _playAudio,
// // //                   style: ElevatedButton.styleFrom(
// // //                     backgroundColor: Colors.amberAccent,
// // //                     padding: const EdgeInsets.symmetric(
// // //                         horizontal: 30, vertical: 15),
// // //                     textStyle: const TextStyle(fontSize: 18),
// // //                     shape: RoundedRectangleBorder(
// // //                       borderRadius: BorderRadius.circular(10),
// // //                     ),
// // //                   ),
// // //                   child: const Icon(Icons.voice_chat),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
