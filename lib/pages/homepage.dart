import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vidhan/main.dart';
import 'package:vidhan/pages/profile_page.dart';
import 'package:vidhan/pages/settings_page.dart';
import 'package:vidhan/utility/bottom_nav.dart';
import '../content/video_player_page.dart';
import 'chat.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showChatBox(context);
            // Open the chatbox here
            // Navigator.pushNamed(context, '/chatbox');
          },
          child: const Icon(FontAwesomeIcons.robot,),
        ),
        body: ListView(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children:[
                      Container(
                      width: double.infinity,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/youtube1.jpg'), // Replace with your image path
                          fit:
                          BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      child: Container(
                        height: 10,
                        width: 10,
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Set the radius here
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoutubeVideoPlayer(
                                    videoId:
                                        'ogfo2cM-ZeU'), // Replace with your video ID
                              ),
                            );
                            // ... your existing onPressed code...
                          },
                          child: Text('Learn now',style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Stack(
                    children: [
                      Container(
                      width: double.infinity,
                      height: 120,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/quize.jpg'), // Replace with your image path
                          fit: BoxFit.cover, // Adjust the fit as needed
                        ),
                      ),
                      // decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(50)),
                      child: Container(
                        height: 10,
                        width: 10,
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade300,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Set the radius here
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                Navigator.pushNamed(context, '/quiz')
                                    as Route<Object?>);
                          },
                          child: Text('Quiz'),
                        ),
                      ),
                    ),
                 ], ),
                ],
              ),
            ),
          ],
        ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _showChatBox(context);
      //   },
      //   child: Icon(Icons.chat),
      //   backgroundColor: Colors.blue,
      // ),
    );
  }

  void _showChatBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ask a Question"),
          content: ChatBox(),
          actions: [
            TextButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

  }
}
