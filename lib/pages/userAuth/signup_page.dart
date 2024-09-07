import 'package:flutter/material.dart';
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

  final TextEditingController _usernameController= TextEditingController();
  final TextEditingController _emailController= TextEditingController();
  final TextEditingController _passwordController= TextEditingController();
  @override
  void dispose(){
    _usernameController.dispose();
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
                "Sign up",
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
                controller: _usernameController,
                hintText: "Enter username",
                isPasswordField: false,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Name is too short';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              FormContainerWidget(
                controller: _emailController,
                hintText: "Enter email",
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
                hintText: "Enter password",
                isPasswordField: true,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Password is too short';
                    }
                    return null;
                  }
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: _signUp,
                //     (){
                //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> HomePage()),(route)=> false);
                // },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:  Center(
                      child: _isSignup ? CircularProgressIndicator(color: Colors.white,): Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),(route)=>false);
                    },
                    child: const Text(
                      "Login",
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
  void _signUp() async {

    setState(() {
      _isSignup = true;
    });
    String email= _emailController.text;
    String username= _usernameController.text;
    String password= _passwordController.text;

    User? user= await _auth.signUpWithEmailandPassword(username,context, email, password);

    setState(() {
      _isSignup =false;
    });
    if(user!=null){
      SnackBar(content: Text("user created successfully"));
      Navigator.pushNamed(context, "/login");
    }
    else{
      print("error ocured");
    }
  }
  }