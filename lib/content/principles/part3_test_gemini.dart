// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:google_generative_ai/google_generative_ai.dart'; // Import for Gemini API
//
// // Replace with your actual Gemini API key
// const String geminiApiKey = 'AIzaSyDQale7h_xn3F2dqz62V7u-6pw5DuKyRY4';
//
// final GenerativeModel _model = GenerativeModel(model: 'gemini-pro', apiKey: geminiApiKey);
//
// // --- Placeholder Data (You might fetch this dynamically) ---
// const Map<String, String> articleExplanationsFallback = {
//   "Article 14": "Ensures equality before the law for all citizens.",
//   "Article 15": "Prohibits discrimination based on religion, race, caste, sex, or place of birth.",
//   "Article 16": "Guarantees equal opportunity in public employment.",
//   "Article 19": "Protects freedoms like speech, assembly, association, movement, residence, and profession.",
//   "Article 20": "Provides protection against unfair conviction for offenses.",
//   "Article 21": "Guarantees the right to life and personal liberty.",
//   "Article 23": "Prohibits human trafficking and forced labor.",
//   "Article 24": "Forbids the employment of children below 14 in hazardous jobs.",
//   "Article 25": "Ensures freedom of conscience and the practice of religion.",
//   "Article 26": "Allows religious denominations to manage their own affairs.",
//   "Article 29": "Protects the interests of minorities to conserve their culture, language, and script.",
//   "Article 30": "Grants minorities the right to establish and administer educational institutions.",
//   "Article 32": "Provides the right to constitutional remedies through the Supreme Court.",
// };
//
// // Placeholder YouTube Video IDs
// const Map<String, String> articleVideoIdsFallback = {
//   "Article 14": "your_article_14_video_id",
//   "Article 15": "your_article_15_video_id",
//   "Article 16": "your_article_16_video_id",
//   "Article 19": "your_article_19_video_id",
//   "Article 20": "your_article_20_video_id",
//   "Article 21": "your_article_21_video_id",
//   "Article 23": "your_article_23_video_id",
//   "Article 24": "your_article_24_video_id",
//   "Article 25": "your_article_25_video_id",
//   "Article 26": "your_article_26_video_id",
//   "Article 29": "your_article_29_video_id",
//   "Article 30": "your_article_30_video_id",
//   "Article 32": "your_article_32_video_id",
// };
//
// class RightsPage2 extends StatelessWidget {
//   final List<String> rights = [
//     "Right to Equality",
//     "Right to Freedom",
//     "Right against Exploitation",
//     "Right to Freedom of Religion",
//     "Cultural and Educational Rights",
//     "Right to Constitutional Remedies",
//   ];
//
//   final Map<String, String> rightDescriptions = {
//     "Right to Equality": "The State shall not deny to any person equality before the law.",
//     "Right to Freedom": "Protection of certain rights regarding freedom of speech, etc.",
//     "Right against Exploitation": "Prohibition of traffic in human beings and forced labor.",
//     "Right to Freedom of Religion": "Freedom of conscience and free profession, practice, and propagation of religion.",
//     "Cultural and Educational Rights": "Protection of interests of minorities.",
//     "Right to Constitutional Remedies": "Right to move the Supreme Court for enforcement of rights.",
//   };
//
//   final Map<String, List<String>> articles = {
//     "Right to Equality": [
//       "Article 14: The State shall not deny to any person equality before the law.",
//       "Article 15: Prohibition of discrimination on grounds of religion, race, caste, sex or place of birth.",
//       "Article 16: Equality of opportunity in matters of public employment."
//     ],
//     "Right to Freedom": [
//       "Article 19: Protection of certain rights regarding freedom of speech, etc.",
//       "Article 20: Protection in respect of conviction for offenses.",
//       "Article 21: Protection of life and personal liberty."
//     ],
//     "Right against Exploitation": [
//       "Article 23: Prohibition of traffic in human beings and forced labor.",
//       "Article 24: Prohibition of employment of children in factories, etc."
//     ],
//     "Right to Freedom of Religion": [
//       "Article 25: Freedom of conscience and free profession, practice and propagation of religion.",
//       "Article 26: Freedom to manage religious affairs."
//     ],
//     "Cultural and Educational Rights": [
//       "Article 29: Protection of interests of minorities.",
//       "Article 30: Right of minorities to establish and administer educational institutions."
//     ],
//     "Right to Constitutional Remedies": [
//       "Article 32: Right to constitutional remedies."
//     ],
//   };
//
//   RightsPage2({super.key});
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
//               const Text('Fundamental Rights',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               ...rights.map((right) {
//                 return DutyCard(
//                     right: right,
//                     description: rightDescriptions[right]!,
//                     articles: articles[right]!);
//               }),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DutyCard extends StatelessWidget {
//   final String right;
//   final String description;
//   final List<String> articles;
//
//   const DutyCard({
//     super.key,
//     required this.right,
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
//             builder: (context) => ArticleDetailPage(
//                 article: right, description: description, articles: articles),
//           ),
//         );
//       },
//       child: Card(
//         color: const Color(0xFFACB3D5),
//         elevation: 4,
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 right,
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 description,
//                 style: const TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ArticleDetailPage extends StatefulWidget {
//   final String article;
//   final String description;
//   final List<String> articles;
//
//   const ArticleDetailPage({
//     super.key,
//     required this.article,
//     required this.description,
//     required this.articles,
//   });
//
//   @override
//   State<ArticleDetailPage> createState() => _ArticleDetailPageState();
// }
//
// class _ArticleDetailPageState extends State<ArticleDetailPage> {
//   bool _isVideoVisible = false;
//   YoutubePlayerController? _controller;
//
//   Future<String> _getAiExplanation(String articleText) async {
//     try {
//       final prompt = 'Explain the following Indian Constitutional article in simple terms: $articleText';
//       final response = await _model.generateContent([**Content.text**(prompt)]); // Corrected line
//     return response.text?.trim() ?? articleExplanationsFallback[articleText.split(':').first.trim()] ?? 'Explanation not available.';
//     } catch (e) {
//     print('Error fetching AI explanation: $e');
//     return articleExplanationsFallback[articleText.split(':').first.trim()] ?? 'Explanation not available.';
//     }
//   }
//
//   void _showExplanationDialog(String articleText) async {
//     String explanation = await _getAiExplanation(articleText);
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('AI Explanation'),
//           content: SingleChildScrollView(
//             child: Text(explanation),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showVideo(String videoId) {
//     setState(() {
//       _controller = YoutubePlayerController(
//         initialVideoId: videoId,
//         flags: const YoutubePlayerFlags(
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
//         title: Text(widget.article),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           decoration: BoxDecoration(
//             color: const Color(0xFFE0F7FA), // Light cyan background
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: ListView(
//               children: [
//                 Text(
//                   "Articles under ${widget.article} :",
//                   style: const TextStyle(
//                     fontSize: 20,
//                     color: Colors.black87,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 ...widget.articles.map((subArticle) {
//                   final articleKey = subArticle.split(':').first.trim();
//                   final videoId = articleVideoIdsFallback[articleKey] ?? '';
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             spreadRadius: 1,
//                             blurRadius: 3,
//                             offset: const Offset(0, 2),
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
//                                 fontSize: 16,
//                                 color: Colors.black87,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.end,
//                               children: [
//                                 ElevatedButton.icon(
//                                   onPressed: () => _showExplanationDialog(subArticle),
//                                   icon: const Icon(Icons.lightbulb_outline),
//                                   label: const Text('AI Explain'),
//                                   style: ElevatedButton.styleFrom(
//                                     foregroundColor: Colors.white,
//                                     backgroundColor: Colors.blueAccent,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 8),
//                                 ElevatedButton.icon(
//                                   onPressed: videoId.isNotEmpty ? () => _showVideo(videoId) : null,
//                                   icon: const Icon(Icons.play_circle_outline),
//                                   label: const Text('Watch'),
//                                   style: ElevatedButton.styleFrom(
//                                     foregroundColor: Colors.white,
//                                     backgroundColor: Colors.green,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/quiz_1');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.amberAccent,
//                     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//                     textStyle: const TextStyle(fontSize: 18, color: Colors.black87),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                   child: const Center(child: Text("Play Quiz")),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }