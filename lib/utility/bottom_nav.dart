import 'package:flutter/material.dart';
import 'package:vidhan/pages/homepage.dart';
import 'package:vidhan/pages/profile_page.dart';
import 'package:vidhan/pages/settings_page.dart';
import 'package:vidhan/pages/test.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedindex = 0;
  PageController pageController = PageController();

  // List<Widget> widgets = [
  //   Text('Home'),
  //   Text('Search'),
  //   Text('Add'),
  //   Text('Profile'),
  // ];
  void onTapped(int index) {
    setState(() {
      selectedindex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Bottom Nav')),
      body: PageView(
        controller: pageController,
        children: [
          HomePage(),
          ProfilePage(name: 'sachin', age: 22, profilePictureUrl: 'https://i.pinimg.com/736x/9f/9f/bb/9f9fbb3b96703d08b68aaa8c34aba638.jpg', progress: 75,),
          ProfilePage2(),
          SettingsPage(),
          // SnackbarWidget()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bar_chart,
              ),
              label: 'Stats'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'Settings'),

        ],
        currentIndex: selectedindex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}