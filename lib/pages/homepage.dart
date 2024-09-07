import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vidhan/main.dart';
import 'package:vidhan/pages/profile_page.dart';
import 'package:vidhan/pages/settings_page.dart';
import 'package:vidhan/utility/bottom_nav.dart';

import '../content/video_player_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.grey,
          child: Column(
            children: [
              DrawerHeader(child: Text("Vidhan")),
              // ListTile(
              //   leading: const Icon(Icons.home),
              //   title: const Text("Home"),
              //   onTap: () {
              //     // Navigator.popUntil(context, ModalRoute.withName('/home'));
              //     // Navigator.pushReplacementNamed(context, '/home');
              //     Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.person),
              //   title: const Text("Profile"),
              //   onTap: () {
              //     Navigator.pushNamedAndRemoveUntil(context, '/profile', (route) => false);
              //     // Navigator.pop(context);
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.settings),
              //   title: const Text("Settings"),
              //   onTap: () {
              //     Navigator.pushNamed(context, '/settings');
              //   },
              // ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sign out"),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
              // Add more ListTiles as needed
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Vidhan"),
        ),

        body:
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container( width: double.infinity, height: 80,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                  ),
                  onPressed: () {
                    // Navigate to the YouTube Video Player page with a specific video ID
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YoutubeVideoPlayer(videoId: 'TBxo3IKYKow'), // Replace with your video ID
                      ),
                    );
                  },
                  child: Text('Play YouTube Video'),
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                // decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(50)),
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz');
                    },
                    child: Text('Quiz'),
              ),
              ),

            ],
          ),
        ));
  }
}
