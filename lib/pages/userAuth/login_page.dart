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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Image.asset(
                'assets/logo.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "email",
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
                  hintText: "password",
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
                //     () {
                //   Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(builder: (context) => HomePage()),
                //       (route) => false);
                // },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: _isSigning
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
                  const Text("Don't have an account?"),
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
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
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

    User? user = await _auth.signInWithEmailandPassword( context, email, password);

    setState(() {
      _isSigning = false;
    });
    if (user != null) {
      SnackBar(content: Text("sign in successfull"));
      Navigator.pushNamedAndRemoveUntil(context, '/nav', (route) => false);
    } else {
      print("error ocured");
    }
  }
}
