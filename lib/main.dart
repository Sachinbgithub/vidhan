import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vidhan/games/quize/screens/quiz_screen.dart';
import 'package:vidhan/pages/homepage.dart';
import 'package:vidhan/pages/splashscreen.dart';
import 'package:vidhan/pages/userAuth/login_page.dart';

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
      home: const SplashScreenWrapper(),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/quiz': (context) => const QuizScreen(),
      },
    );
  }
}

class SplashScreenWrapper extends StatefulWidget{
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
          Navigator.pushReplacementNamed(context, '/home');
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