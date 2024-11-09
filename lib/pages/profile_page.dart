import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage2 extends StatelessWidget {
  final String name;
  final int age;
  final String profilePictureUrl;
  final double progress;

  // Constructor to receive data
  ProfilePage2({
    required this.name,
    required this.age,
    required this.profilePictureUrl,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Color(0xFF8D493A), // AppBar color
        title: Text(
          'P r o f i l e',

          style: GoogleFonts.pacifico(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home'); // Navigate to home page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_richard.jpg'), // Replace with your image asset
            ),
            SizedBox(height: 20),
            // User Name
            Text(
              'Sufi_s   ',
              style: GoogleFonts.pacifico(
                fontSize: 40,
                color: Color(0xFF8D493A),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // User Info
            Text(
              'Flutter Developer | Tech Enthusiast',
              style: GoogleFonts.openSans(
                fontSize: 20,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 30),
            // Stats Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatCard('20', 'Completed Quizzes'),
                _buildStatCard('50', 'Achievements'),
              ],
            ),
            SizedBox(height: 30),
            // Action Buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to settings or any other page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8D493A), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Settings',
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle logout or other actions
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFDDE55), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Logout',
                style: GoogleFonts.openSans(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label) {
    return Container(
      width: 160,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFF68D2E8), // Card background color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: GoogleFonts.pacifico(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.openSans(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
