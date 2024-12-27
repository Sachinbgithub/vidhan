import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:vidhan/pages/userAuth/form_controller_widget.dart';
import 'package:vidhan/pages/userAuth/signup_db.dart';
import 'package:vidhan/pages/userAuth/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_auth_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isSigning = false;

  final FirebaseAuthService _auth = FirebaseAuthService();

  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
          image: DecorationImage(
            image: AssetImage(""), // add registerrr.png here
            // Replace with your image path
            fit: BoxFit
                .cover, // Adjust how the image fits (cover, contain, etc.)
          ),
        ),
        child: Stack(
          children: [
            // Lottie animation added here
            Positioned.fromRect(
              rect: Rect.fromLTWH(100, 10, 210, 250),
              child: Lottie.network(
                'https://lottie.host/6064e841-95af-485f-9d4a-77a0ea1ca795/bXWouOhFq6.json',
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "L O G I N ",
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
                      onTap: _signIn,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF004271),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              offset: Offset(3, 7),
                            ),
                          ],
                        ),
                        child: Center(
                          child: _isSigning
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Color(0xFFFFF4EA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: _signInWithGoogle,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFF004271),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 10,
                              offset: Offset(3, 7),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(FontAwesomeIcons.google),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Signin with google",
                                style: TextStyle(
                                  color: Color(0xFFFFF4EA),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "New Here?",
                          style: TextStyle( fontSize: 20, color: Colors.black54),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage2()),
                                (route) => false);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle( fontSize: 20, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // ElevatedButton.icon(
                    //   onPressed: _signInWithGoogle,
                    //   icon: const Icon(Icons.login),
                    //   label: const Text("Sign in with Google"),
                    //   style: ElevatedButton.styleFrom(
                    //     backgroundColor: Colors.white,
                    //     foregroundColor: Colors.black,
                    //     minimumSize: const Size(double.infinity, 50),
                    //   ),
                    // ),
                    // Skip Button at the bottom
                    // Skip Button with modified size
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

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user =
        await _auth.signInWithEmailandPassword(context, email, password);

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

  // Skip button action
  void _skipLogin() {
    Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
  }

// Sign in with Google method
  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      // Navigate to the next screen or perform other actions after successful sign-in
      Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
    } catch (e) {
      print(e);
      // Handle sign-in errors
    }
  }
}
