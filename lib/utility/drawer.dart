import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        children: [
          DrawerHeader(child: Text("Vidhan")),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/home'));
              // Navigator.pushReplacementNamed(context, '/home');
              // Handle profile tap
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              // Handle settings tap
              // Navigator.popUntil(context, ModalRoute.withName('/profile'));
              Navigator.pushNamed(context, '/profile');
              // Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sign out"),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
          // Add more ListTiles as needed
        ],
      ),
    );
  }
}
