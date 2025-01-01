// currently in use
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  bool _isEditing = false;
  bool _isLoading = false;
  int _selectedProfileIndex = 0;

  // List of profile pictures from assets
  final List<String> profilePictures = [
    'assets/profile/img.png',
    'assets/profile/img_1.png',
    'assets/profile/img_2.png',
    'assets/profile/img_3.png',
    'assets/profile/img_4.png',
    'assets/profile/img_5.png',
    // Add more profile picture paths as needed
  ];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>?> _getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      return doc.data();
    }
    return null;
  }

  Future<void> _updateUsername() async {
    if (_nameController.text.trim().isEmpty) return;

    setState(() => _isLoading = true);
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'name': _nameController.text.trim()});

        setState(() => _isEditing = false);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Username updated successfully')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating username: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _updateProfilePicture(int index) async {
    setState(() => _isLoading = true);
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'profilePictureIndex': index});

        setState(() => _selectedProfileIndex = index);
        if (mounted) {
          Navigator.pop(context); // Close the dialog
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Profile picture updated successfully')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating profile picture: $e')),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showProfilePictureSelector() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Select Profile Picture',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: profilePictures.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => _updateProfilePicture(index),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profilePictures[index]),
                    child: _selectedProfileIndex == index
                        ? const Icon(Icons.check, color: Colors.white)
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(Map<String, dynamic> userData) {
    final profileIndex = userData['profilePictureIndex'] ?? 0;
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(profilePictures[profileIndex]),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: GestureDetector(
            onTap: _isLoading ? null : _showProfilePictureSelector,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: _isLoading
                  ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
                  : const Icon(
                Icons.camera_alt,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileHeader(Map<String, dynamic> userData) {
    if (!_isEditing) {
      _nameController.text = userData['name'] ?? '';
    }

    return Column(
      children: [
        _buildProfileImage(userData),
        const SizedBox(height: 16),
        _isEditing
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _updateUsername,
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => setState(() => _isEditing = false),
            ),
          ],
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              userData['name'] ?? 'No Name',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => setState(() => _isEditing = true),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          userData['email'] ?? 'No Email',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStats(Map<String, dynamic> userData) {
    final List<Map<String, dynamic>> dailyQuizScores =
    List<Map<String, dynamic>>.from(userData['dailyQuizScores'] ?? []);
    dailyQuizScores.sort((a, b) => b['date'].compareTo(a['date']));

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _StatCard(
              title: 'Reward Points',
              value: userData['rewardPoints']?.toString() ?? '0',
              icon: Icons.star,
            ),
            // _StatCard(
            //   title: 'Daily Quiz Points',
            //   value: userData['totalQuizPoints']?.toString() ?? '0',
            //   icon: Icons.star,
            // ),
            _StatCard(
              title: 'Daily Streak',
              value: userData['dailyStreak']?.toString() ?? '0',
              icon: Icons.local_fire_department,
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Daily Quiz History',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dailyQuizScores.take(7).length,
            itemBuilder: (context, index) {
              final score = dailyQuizScores[index];
              return ListTile(
                leading: const Icon(Icons.add_task_outlined),
                title: Text('Score: ${score['score']}/10'),
                subtitle: Text('Date: ${score['date']}'),
                trailing: score['score'] >= 7
                    ? const Icon(Icons.emoji_events, color: Colors.amber)
                    : null,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue[50],
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (mounted) {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login', (route) => false);
              }
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return Center(
              child:  Column(
                children: [
                  const Center(child: Text('No user data found'),
                  ),
                  const SizedBox(height: 20,),
                   const Text("Login for profile access!"),
                  Center(
                    child:IconButton(
                      icon: const Icon(Icons.login),
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        if (mounted) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        }
                      },
                    ),
                  )
                ],
              ),
            );

          }

          final userData = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildProfileHeader(userData),
                  const SizedBox(height: 24),
                  _buildStats(userData),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).primaryColor),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}