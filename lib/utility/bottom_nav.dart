import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:vidhan/pages/homepage.dart';
import 'package:vidhan/pages/leaderboard.dart';
import 'package:vidhan/pages/settings_page.dart';
import '../pages/profilepage.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

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
        children: const [
          HomePage(),
          ProfilePage(),
          Leaderboard(),
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
        buttonBackgroundColor: Colors.blue.shade800,
        backgroundColor: Colors.blue.shade50,
        // backgroundColor: Color(0xFF8D493A),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: onTapped,
      ),
    );
  }
}
