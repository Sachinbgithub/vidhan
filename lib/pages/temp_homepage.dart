import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Chatbot/chatbot.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Marathi', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF3F3),
      // backgroundColor: Colors.brown[100],
      drawer: _buildDrawer(),
      appBar: _buildAppBar(),
      floatingActionButton: _buildFloatingActionButton(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('Featured'),
                SizedBox(height: 16),
                _buildFeaturedSection(),
                SizedBox(height: 24),
                _buildSectionTitle('Games'),
                SizedBox(height: 16),
                _buildGamesSection(),
                SizedBox(height: 24),
                _buildSectionTitle('Constitution'),
                SizedBox(height: 16),
                _buildConstitutionSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        color: Color(0xFFFEECB3),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFA04747),
              ),
              child: Text(
                "V I D H A N",
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
            _buildDrawerItem(Icons.home, "H O M E",
                () => Navigator.pushReplacementNamed(context, '/home')),
            _buildDrawerItem(Icons.settings, "S E T T I N G S", () {}),
            _buildDrawerItem(Icons.logout, "S I G N O U T", () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Color(0xFFA04747)),
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFFA04747),
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      // backgroundColor: Colors.brown[400],
      title: Text(
        "Vidhan",
        style: TextStyle(
          color: Color(0xFFFFFBE6),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Color(0xFFFFFBE6)),
          onPressed: () => Navigator.pushNamed(context, '/notifications'),
        ),
        PopupMenuButton<String>(
          icon: Icon(Icons.language, color: Color(0xFFFFFBE6)),
          onSelected: (String result) {
            setState(() {
              _selectedLanguage = result;
            });
          },
          itemBuilder: (BuildContext context) {
            return _languages.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
        SizedBox(width: 10),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _showChatBox(context),
      child: Icon(FontAwesomeIcons.robot),
      backgroundColor: Colors.brown[400],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.brown[800],
      ),
    );
  }

  Widget _buildFeaturedSection() {
    return Column(
      children: [
        _buildFeaturedCard(
          'Daily Quiz',
          '10 questions',
          'assets/const2.jpg',
          () => Navigator.pushNamed(context, '/quize'),
        ),
        SizedBox(height: 16),
        _buildFeaturedCard(
          'Did you know?',
          '13 may - 19 may',
          'assets/Const.jpg',
          () => Navigator.pushNamed(context, '/facts'),
        ),
      ],
    );
  }

  Widget _buildFeaturedCard(
      String title, String subtitle, String imagePath, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGamesSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGameCard('Court', 'assets/court2.jpg',
            () => Navigator.pushNamed(context, '/facts')),
        _buildGameCard('Snake & Ladder', 'assets/snl.png',
            () => Navigator.pushNamed(context, '/snake')),
        _buildGameCard('Word Game', 'assets/word.png',
            () => Navigator.pushNamed(context, '/web')),
      ],
    );
  }

  Widget _buildGameCard(String title, String imagePath, VoidCallback onTap) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConstitutionSection() {
    return Column(
      children: [
        _buildConstitutionCard(
          'Part III: Basic Human Rights & Duties',
          'assets/protest.jpg',
          () => Navigator.pushNamed(context, '/part_3'),
        ),
        SizedBox(height: 16),
        _buildConstitutionCard(
          'Part IV: Directive Principles of State Policy',
          'assets/part_IV.jpg',
          () => Navigator.pushNamed(context, '/part_4'),
        ),
        SizedBox(height: 16),
        _buildConstitutionCard(
          'Part V: The Union',
          'assets/crowd.jpg',
          () => Navigator.pushNamed(context, '/part_5'),
        ),
      ],
    );
  }

  Widget _buildConstitutionCard(
      String title, String imagePath, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black.withOpacity(0.7), Colors.transparent],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showChatBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Chat_Bot();
      },
    );
  }
}
