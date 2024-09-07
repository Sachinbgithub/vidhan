import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final int age;
  final String profilePictureUrl;
  final double progress;

  // Constructor to receive data
  ProfilePage({
    required this.name,
    required this.age,
    required this.profilePictureUrl,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(profilePictureUrl),
              backgroundColor: Colors.grey.shade200,
            ),
            SizedBox(height: 20),

            // Name
            Text(
              name,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Age
            Text(
              'Age: $age',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20),

            // Progress
            Text(
              'Progress: ${progress.toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),

            // Progress Bar
            Container(
              width: double.infinity,
              child: LinearProgressIndicator(
                value: progress / 100, // Convert to a value between 0.0 and 1.0
                minHeight: 20,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Handle edit profile action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}