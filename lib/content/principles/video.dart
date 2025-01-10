import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ConstitutionalRightsPage extends StatefulWidget {
  const ConstitutionalRightsPage({Key? key}) : super(key: key);

  @override
  State<ConstitutionalRightsPage> createState() => _ConstitutionalRightsPageState();
}

class _ConstitutionalRightsPageState extends State<ConstitutionalRightsPage> {
  YoutubePlayerController? _controller;
  bool _isVideoVisible = false;

  // Map of constitutional rights to their video content
  final Map<String, List<Map<String, dynamic>>> rightsContent = {
    "Right to Equality": [
      {
        'title': 'Equality Before Law (Article 14)',
        'videoId': '18Qy9EZrF9Y',
        'explanation': 'Article 14 ensures equality before law and equal protection of laws. This means every person, regardless of status, is subject to the same laws.',
      },
      {
        'title': 'Prohibition of Discrimination (Article 15)',
        'videoId': 'FAVAYx3TspY&t',
        'explanation': 'Article 15 prohibits discrimination on grounds of religion, race, caste, sex, or place of birth.',
      },
    ],
    "Right to Freedom": [
      {
        'title': 'Freedom of Speech (Article 19)',
        'videoId': 'pyrOqX4zQLI',
        'explanation': 'Article 19 protects six fundamental freedoms including speech, expression, assembly, and movement.',
      },
      {
        'title': 'Protection of Life (Article 21)',
        'videoId': 'SsF1AWjhBY4',
        'explanation': 'Article 21 guarantees the right to life and personal liberty.',
      },
    ],
    // Add more rights and their videos
  };

  void _initializeVideo(String videoId) {
    setState(() {
      _controller?.dispose();
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          enableCaption: true,
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
        title: const Text('Constitutional Rights Videos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFACB3D5),
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 10.0,
                blurRadius: 10.0,
                offset: Offset(3.1, 2),
              ),
            ],
          ),
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const Text(
                "Video Lectures on Constitutional Rights",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (_isVideoVisible && _controller != null) ...[
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: YoutubePlayer(
                      controller: _controller!,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.red,
                      progressColors: const ProgressBarColors(
                        playedColor: Colors.red,
                        bufferedColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              ...rightsContent.entries.expand((right) => [
                ...right.value.map((content) => Padding(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content['title'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            content['explanation'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    _initializeVideo(content['videoId']),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[700],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.play_circle_outline,
                                        size: 20),
                                    SizedBox(width: 8),
                                    Text('Watch Video'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              ]),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/quiz_1');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amberAccent,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Center(child: Text("Play Quiz")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}