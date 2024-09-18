import 'package:flutter/material.dart';
import 'package:vidhan/pages/userAuth/form_controller_widget.dart';
import 'package:vidhan/pages/userAuth/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(

          color: Color(0xFFFF8A8A),
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xFFD0B8A8), // Light Blue color code
          //     Color(0xFF8D493A), // Dark Blue color code
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),

        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFCCE0AC),
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black45,
                        offset: Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  'assets/learn_cons.jpg', // Use a more game-like logo
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
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
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                    controller: _passwordController,
                    hintText: "Password",
                    isPasswordField: true,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return 'Password is too short';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: _signIn,
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFFCCE0AC),

                      // gradient: LinearGradient(
                      //   colors: [
                      //     Color(0xFF8D493A), // Hex color #8D493A
                      //     Color(0xFFF8EDE3), // Hex color #F8EDE3
                      //   ],
                      //   begin: Alignment.topLeft,
                      //   end: Alignment.bottomRight,
                      // ),
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
                      child: _isSigning
                          ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Text(
                        "Play & Login",
                        style: TextStyle(
                          color: Color(0xFF8D493A),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New Here?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()),
                                (route) => false);
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.orangeAccent),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailandPassword(context, email, password);

    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign in successful!")),
      );
      Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
    } else {
      print("Error occurred");
    }
  }
}
