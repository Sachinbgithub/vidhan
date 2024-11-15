import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidhan/content/facts.dart';
import 'package:vidhan/content/principles/temp_part_III.dart';

import 'package:vidhan/content/principles/see_all.dart';
import 'package:vidhan/games/quize/screens/quiz_screen.dart';
import 'package:vidhan/games/snakes/snakes_ladders.dart';
import 'package:vidhan/pages/homepage.dart';
import 'package:vidhan/pages/settings_page.dart';
import 'package:vidhan/pages/splashscreen.dart';
import 'package:vidhan/pages/userAuth/login_page.dart';
import 'package:vidhan/utility/bottom_nav.dart';

import 'content/principles/part_4.dart';
import 'content/principles/part_5.dart';
import 'content/principles/principles_quize/screens/quiz_screen.dart';
import 'games/courtRoom/courtroom.dart';
import 'games/educandy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // TODO this is for web setup
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCyJsWqNsHnu9WgDdWrEb5NvdS7r9CwJfY',
          appId: '1:861451830242:android:2b4a8190de6ac086756fbb',
          messagingSenderId: '861451830242',
          projectId: 'vidhan-865c0'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context)
              .textTheme, // You can replace 'poppins' with any font
        ),
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreenWrapper(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/quize': (context) => const QuizScreen(),
        // '/Pquize': (context) => const PrinQuiz(),
        '/snake': (context) => const GameHome(),
        '/edu': (context) => const WebViewExample(),
        '/part_4': (context) => DutiesAndPrinciplesPage(),
        '/part_5': (context) => UnionPage(),
        '/facts': (context) =>  Facts(),
        '/part_3': (context) => RightsPage2(),
        '/web': (context) => const WebViewExample(),
        '/seeall': (context) => const SeeAll(),
        // '/profile': (context) => const ProfilePage(),
        '/settings': (context) => SettingsPage(),
        '/nav': (context) => const BottomNav(),
        '/courtroom':(context) => CourtroomGameApp(),
      },
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    // Simulate splash screen duration
    Timer(const Duration(seconds: 5), () {
      // Navigate based on authentication state
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          // Navigate to the home page if the user is signed in
          Navigator.pushReplacementNamed(context, '/nav');
        } else {
          // Navigate to the login page if the user is not signed in
          Navigator.pushReplacementNamed(context, '/login');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}
