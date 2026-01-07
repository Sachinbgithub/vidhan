import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vidhan/content/principles/see_all.dart';
import 'package:vidhan/pages/homepage.dart';
import 'package:vidhan/utility/splashscreen.dart';
import 'package:vidhan/pages/userAuth/login_page.dart';
import 'package:vidhan/pages/userAuth/signup_db.dart';
import 'package:vidhan/utility/bottom_nav.dart';
import 'content/facts_test.dart';
import 'content/principles/part_4.dart';
import 'content/principles/part_5.dart';
import 'content/principles/video.dart';
import 'games/courtRoom/test.dart';
import 'games/educandy.dart';
import 'games/quize/daily_quize.dart';
import 'games/quize/quiz_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCyJsWqNsHnu9WgDdWrEb5NvdS7r9CwJfY',
      appId: '1:861451830242:android:2b4a8190de6ac086756fbb',
      messagingSenderId: '861451830242',
      projectId: 'vidhan-865c0',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false; // State for theme toggle

  void toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: SplashScreenWrapper(
        toggleTheme: toggleTheme,
        isDarkMode: _isDarkMode,
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (BuildContext context) => SignUpPage(),
        '/quize': (context) => const DailyConstitutionQuiz(),
        '/quiz_test': (context) => const ConstitutionQuiz(),
        '/edu': (context) => const WebViewExample(),
        '/part_4': (context) =>  DutiesAndPrinciplesPage(),
        '/part_5': (context) =>  UnionPage(),
        '/facts': (context) => const EnhancedConstitutionFactsPage(),
        '/part_3': (context) =>  ConstitutionalRightsPage(),
        '/web': (context) => const WebViewExample(),
        '/seeall': (context) => const SeeAll(),
        // '/settings': (context) =>
            // SettingsPage(toggleTheme: toggleTheme, isDarkMode: _isDarkMode),
        '/nav': (context) => const BottomNav(),
        '/courtroom': (context) => const CourtroomGame(),

        // Quiz routes
        // '/quiz_1': (context) => RightToEquality(),
      },
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const SplashScreenWrapper(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/nav');
        } else {
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


//
//
// // import 'dart:async';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:vidhan/content/facts.dart';
// // import 'package:vidhan/content/principles/temp_part_III.dart';
// //
// // import 'package:vidhan/content/principles/see_all.dart';
// // import 'package:vidhan/games/quize/screens/quiz_screen.dart';
// // import 'package:vidhan/games/snakes/snakes_ladders.dart';
// // import 'package:vidhan/pages/homepage.dart';
// // import 'package:vidhan/pages/settings_page.dart';
// // import 'package:vidhan/pages/splashscreen.dart';
// // import 'package:vidhan/pages/userAuth/login_page.dart';
// // import 'package:vidhan/utility/bottom_nav.dart';
// //
// // import 'content/principles/part_4.dart';
// // import 'content/principles/part_5.dart';
// // import 'content/principles/principles_quize/screens/quiz_screen.dart';
// // import 'games/courtRoom/courtroom.dart';
// // import 'games/educandy.dart';
// //
// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //       // TODO this is for web setup
// //       options: const FirebaseOptions(
// //           apiKey: 'AIzaSyCyJsWqNsHnu9WgDdWrEb5NvdS7r9CwJfY',
// //           appId: '1:861451830242:android:2b4a8190de6ac086756fbb',
// //           messagingSenderId: '861451830242',
// //           projectId: 'vidhan-865c0'));
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         textTheme: GoogleFonts.poppinsTextTheme(
// //           Theme.of(context)
// //               .textTheme, // You can replace 'poppins' with any font
// //         ),
// //         primarySwatch: Colors.green,
// //         visualDensity: VisualDensity.adaptivePlatformDensity,
// //       ),
// //       home: const SplashScreenWrapper(),
// //       routes: {
// //         '/home': (context) => const HomePage(),
// //         '/login': (context) => const LoginPage(),
// //         '/quize': (context) => const QuizScreen(),
// //         // '/Pquize': (context) => const PrinQuiz(),
// //         '/snake': (context) => const GameHome(),
// //         '/edu': (context) => const WebViewExample(),
// //         '/part_4': (context) => DutiesAndPrinciplesPage(),
// //         '/part_5': (context) => UnionPage(),
// //         '/facts': (context) =>  Facts(),
// //         '/part_3': (context) => RightsPage2(),
// //         '/web': (context) => const WebViewExample(),
// //         '/seeall': (context) => const SeeAll(),
// //         // '/profile': (context) => const ProfilePage(),
// //         '/settings': (context) => SettingsPage(),
// //         '/nav': (context) => const BottomNav(),
// //         '/courtroom':(context) => CourtroomGameApp(),
// //       },
// //     );
// //   }
// // }
// //
// // class SplashScreenWrapper extends StatefulWidget {
// //   const SplashScreenWrapper({super.key});
// //
// //   @override
// //   State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
// // }
// //
// // class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Simulate splash screen duration
// //     Timer(const Duration(seconds: 5), () {
// //       // Navigate based on authentication state
// //       FirebaseAuth.instance.authStateChanges().listen((User? user) {
// //         if (user != null) {
// //           // Navigate to the home page if the user is signed in
// //           Navigator.pushReplacementNamed(context, '/nav');
// //         } else {
// //           // Navigate to the login page if the user is not signed in
// //           Navigator.pushReplacementNamed(context, '/login');
// //         }
// //       });
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return const SplashScreen();
// //   }
// // }
