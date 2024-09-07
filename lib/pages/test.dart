import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage2 extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connection pending...'),
      ),
      body: FutureBuilder<User?>(
        future: _fetchUserProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error fetching user data'));
          }

          User? user = snapshot.data;

          if (user == null) {
            return Center(child: Text('No user signed in'));
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${user.displayName ?? "No name available"}', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('Email: ${user.email}', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                Text('User ID: ${user.uid}', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                user.photoURL != null
                    ? Image.network(user.photoURL!)
                    : Text('No profile picture available'),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<User?> _fetchUserProfile() async {
    User? user = _auth.currentUser;
    return user;
  }
}