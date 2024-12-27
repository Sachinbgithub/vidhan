import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vidhan/pages/userAuth/form_controller_widget.dart'; // Adjust this import based on your project structure

class SignUpPage2 extends StatefulWidget {
  const SignUpPage2({super.key});

  @override
  State<SignUpPage2> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage2> {
  bool _isSignup = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/registerrr.png"), // Add your image path here
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Register", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white)),
                    const SizedBox(height: 30),
                    FormContainerWidget(controller: _usernameController, hintText: "Username", isPasswordField: false),
                    const SizedBox(height: 20),
                    FormContainerWidget(controller: _emailController, hintText: "Email", isPasswordField: false),
                    const SizedBox(height: 20),
                    FormContainerWidget(controller: _passwordController, hintText: "Password", isPasswordField: true),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: _signUp,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(color: const Color(0xFF004271), borderRadius: BorderRadius.circular(50)),
                        child: Center(child: _isSignup ? const CircularProgressIndicator(color: Colors.white) : const Text("SIGN UP", style: TextStyle(color: Color(0xFFFFF4EA), fontWeight: FontWeight.bold, fontSize: 22))),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() { _isSignup = true; });

    String email = _emailController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();

    try {
      if (email.isEmpty || username.isEmpty || password.isEmpty) {
        throw Exception("All fields are required.");
      }

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'name': username,
          'email': email,
          'profilePicture': '', // Default empty profile picture
          'rewardPoints': 0, // Initial reward points
          'dailyStreak': 0, // Initial daily streak
        });

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User created successfully")));
        Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    } finally {
      setState(() { _isSignup = false; });
    }
  }
}
