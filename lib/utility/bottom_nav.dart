import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vidhan/pages/homepage.dart';
import 'package:vidhan/pages/profile_page.dart';
import 'package:vidhan/pages/settings_page.dart';
import 'package:vidhan/pages/test.dart';

import '../pages/temp_profile.dart';
import '../pages/userAuth/leaderboard.dart';
import '../pages/userAuth/temp_leader.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedindex = 0;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedindex = index;
          });
        },
        children: [
          HomePage(),
          // ProfilePage(
          //   name: 'sachin',
          //   age: 22,
          //   profilePictureUrl:
          //       'https://i.pinimg.com/736x/9f/9f/bb/9f9fbb3b96703d08b68aaa8c34aba638.jpg',
          //   progress: 75,
          // ),
          ProfilePageLeaderboardStyle(),
          // LeaderboardPage(),
          // EnhancedLeaderboardPage(),
          LeaderboardWithDummyRanks(),
          // ProfilePage2(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedindex,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.bar_chart, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.blue.shade800,
        buttonBackgroundColor: Color(0xFFF8EDE3),
        backgroundColor: Colors.blue,
        // backgroundColor: Color(0xFF8D493A),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: onTapped,
      ),
    );
  }
}
