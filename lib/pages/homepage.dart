import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.grey,
          child: Column(
            children: [
              DrawerHeader(
                  child: Text("Vidhan"
              )),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Home"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/home');
                  // Handle profile tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text("Profile"),
                onTap: () {
                  // Handle settings tap
                  Navigator.pushReplacementNamed(context, '/profile');
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () {
                  // Handle settings tap
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sign out"),
                onTap: () async{
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                  // Navigator.pop(context);
                  // Handle settings tap
                },
              ),
              // Add more ListTiles as needed
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text("Vidhan"),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text("This is home page"),
                           
            ),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, '/quiz');
            },
                child: Text('Quiz'))
          ],
        ));
  }
}
