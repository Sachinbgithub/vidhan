import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:vidhan/pages/userAuth/firebase_auth_services.dart';
import 'package:vidhan/pages/userAuth/form_controller_widget.dart';
import 'package:vidhan/pages/userAuth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isSignup = false;

  final FirebaseAuthService _auth = FirebaseAuthService();
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
            image: AssetImage(""), // add assets/registerrr.png here
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Lottie animation added here
            Positioned.fromRect(
              rect: Rect.fromLTWH(90, 20, 250, 250),
              child: Lottie.network(
                'https://lottie.host/52d9b199-7b32-4ce3-a2c4-422ef60f62db/6kchQb5DS6.json',
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Register",
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
                      controller: _usernameController,
                      hintText: "Username",
                      isPasswordField: false,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 3) {
                          return 'Name is too short';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    FormContainerWidget(
                      controller: _emailController,
                      hintText: "Email",
                      isPasswordField: false,
                      validator: (value) {
                        if (value == null || !value.contains('@')) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    FormContainerWidget(
                      controller: _passwordController,
                      hintText: "Password",
                      isPasswordField: true,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'Password is too short';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: _signUp,
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
                          child: _isSignup
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  "SIGN UP",
                                  style: TextStyle(
                                    color: Color(0xFFFFF4EA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                                (route) => false);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
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
    setState(() {
      _isSignup = true;
    });

    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailandPassword(
      username,
      context,
      email,
      password,
    );

    setState(() {
      _isSignup = false;
    });

    if (user != null) {
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("User created successfully")),
      );
      // Navigate to home page
      Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
    } else {
      // Handle error
      print("Error occurred during sign-up");
    }
  }
}
