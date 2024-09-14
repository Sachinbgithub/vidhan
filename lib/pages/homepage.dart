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
        child: const Icon(
          FontAwesomeIcons.robot,
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Stack(
                //   children: [
                //     Container(
                //       width: double.infinity,
                //       height: 120,
                //       decoration: const BoxDecoration(
                //         image: DecorationImage(
                //           image: AssetImage('assets/youtube1.jpg'),
                //           // Replace with your image path
                //           fit: BoxFit.cover, // Adjust the fit as needed
                //         ),
                //       ),
                //       child: Container(
                //         height: 10,
                //         width: 10,
                //         padding: EdgeInsets.all(5),
                //         alignment: Alignment.bottomRight,
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.red,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(
                //                   20.0), // Set the radius here
                //             ),
                //           ),
                //           onPressed: () {
                //             Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                 builder: (context) => YoutubeVideoPlayer(
                //                     videoId:
                //                         'ogfo2cM-ZeU'), // Replace with your video ID
                //               ),
                //             );
                //           },
                //           child: Text(
                //             'Learn now',
                //             style: TextStyle(color: Colors.white),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 20,
                ),
                // Stack(
                //   children: [
                //     Container(
                //       width: double.infinity,
                //       height: 120,
                //       decoration: const BoxDecoration(
                //         image: DecorationImage(
                //           image: AssetImage('assets/quize.jpg'),
                //           // Replace with your image path
                //           fit: BoxFit.cover, // Adjust the fit as needed
                //         ),
                //       ),
                //       // decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(50)),
                //       child: Container(
                //         height: 10,
                //         width: 10,
                //         padding: EdgeInsets.all(5),
                //         alignment: Alignment.bottomRight,
                //         child: ElevatedButton(
                //           style: ElevatedButton.styleFrom(
                //             backgroundColor: Colors.blue.shade300,
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(
                //                   20.0), // Set the radius here
                //             ),
                //           ),
                //           onPressed: () {
                //             Navigator.push(
                //                 context,
                //                 Navigator.pushNamed(context, '/quiz')
                //                     as Route<Object?>);
                //           },
                //           child: Text('Quiz'),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          Navigator.pushNamed(context, '/quize')
                              as Route<Object?>);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/const2.jpg'),
                          // Replace with your background image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 100,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Daily Quiz",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 8),
                              // Add some spacing between texts
                              Text(
                                "10 questions",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          Navigator.pushNamed(context, '/facts')
                              as Route<Object?>);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/Const.jpg'),
                          // Replace with your background image path
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 100,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Did you know?",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 8),
                              // Add some spacing between texts
                              Text(
                                "13 may - 19 may",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Container(
                        child: Text(
                          "Constitution",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 150),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoutubeVideoPlayer(
                                    videoId:
                                        'ogfo2cM-ZeU'), // Replace with your video ID
                              ),
                            );
                          },
                          child: Text(
                            "See all",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          Navigator.pushNamed(context, '/part_3')
                              as Route<Object?>);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/protest.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  "Part III: Basic Human Rights & Duties",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          Navigator.pushNamed(context, '/part_4')
                              as Route<Object?>);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                        filterQuality: FilterQuality.medium ,
                        image: AssetImage('assets/part_IV.jpg'),
                        fit: BoxFit.cover,
                      ),
                        // color: Colors.red,
                        gradient: const LinearGradient(colors: [Colors.red, Colors.transparent]),
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  "Part IV: Directive Principles of State Policy",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
