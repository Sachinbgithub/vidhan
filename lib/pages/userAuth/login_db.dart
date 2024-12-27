// login_page.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'form_controller_widget.dart';

class LoginPageTest extends StatefulWidget {
  const LoginPageTest({super.key});

  @override
  State<LoginPageTest> createState() => _LoginPageTestState();
}

class _LoginPageTestState extends State<LoginPageTest> {
  bool _isSigning = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _isSigning = true;
    });

    try {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        throw Exception("Email and password are required");
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        if (!mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSigning = false;
        });
      }
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Create Firestore document for new Google users
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'name': googleUser.displayName ?? '',
          'email': googleUser.email,
          'profilePicture': googleUser.photoUrl ?? '',
          'rewardPoints': 0,
          'dailyStreak': 0,
        });
      }

      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/registerrr.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  'https://lottie.host/6064e841-95af-485f-9d4a-77a0ea1ca795/bXWouOhFq6.json',
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black45,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      FormContainerWidget(
                        controller: _emailController,
                        hintText: "Email",
                        isPasswordField: false,
                      ),
                      const SizedBox(height: 20),
                      FormContainerWidget(
                        controller: _passwordController,
                        hintText: "Password",
                        isPasswordField: true,
                      ),
                      const SizedBox(height: 30),
                      _buildLoginButton(),
                      const SizedBox(height: 20),
                      _buildGoogleSignInButton(),
                      const SizedBox(height: 20),
                      _buildSignUpLink(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return GestureDetector(
      onTap: _signIn,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF004271),
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(3, 7),
            ),
          ],
        ),
        child: Center(
          child: _isSigning
              ? const CircularProgressIndicator(color: Colors.white)
              : const Text(
            "LOGIN",
            style: TextStyle(
              color: Color(0xFFFFF4EA),
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return GestureDetector(
      onTap: _signInWithGoogle,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF004271),
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(3, 7),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Sign in with Google",
              style: TextStyle(
                color: Color(0xFFFFF4EA),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "New Here?",
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/signup'),
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ],
    );

    GestureDetector(
      onTap: _skipLogin,
      child: Container(
        width: 200,
        // Adjust this value to change the width (for example, 200 instead of double.infinity)
        height: 45,
        // Adjust this value to change the height (for example, 45 instead of 50)
        decoration: BoxDecoration(
          color: Colors.orangeAccent, // Button color
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(3, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Skip",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
      ),
    );
  }
  // Skip button action
  void _skipLogin() {
    Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
  }
}
