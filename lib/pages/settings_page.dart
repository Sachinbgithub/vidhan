import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  final String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Marathi', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.blue[50],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Change Theme Section
            _buildSectionHeader('Change Theme'),
            _buildThemeSwitch(),
            const SizedBox(height: 20),

            // Additional Settings Section
            _buildSectionHeader('Additional Settings'),
            _buildListTile(Icons.notifications, 'Notifications', () {
              // Navigate to Notifications Screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => NotificationsPage()),
              // );
            }),
            _buildListTile(Icons.security, 'Privacy', () {
              // Navigate to Privacy Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPage()),
              );
            }),
            _buildListTile(Icons.help, 'Help & Support', () {
              // Navigate to Help & Support Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpSupportPage()),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildThemeSwitch() {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: _isDarkMode,
      onChanged: (bool value) {
        setState(() {
          _isDarkMode = value;
        });
        // Implement theme change logic here
      },
      secondary: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
    );
  }

  Widget _buildListTile(IconData icon, String title, Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}

// // Notifications Page
// class NotificationsPage extends StatefulWidget {
//   @override
//   _NotificationsPageState createState() => _NotificationsPageState();
// }
//
// class _NotificationsPageState extends State<NotificationsPage> {
//   bool _newUpdates = true; // Toggle for "New Updates" notifications
//   bool _promotional = true; // Toggle for "Promotional" notifications
//   bool _sound = true; // Toggle for notification sound
//   bool _vibration = true; // Toggle for vibration
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notification Settings'),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16.0),
//         children: [
//           _buildSectionHeader('Notification Preferences'),
//           _buildSwitchTile(
//             'New Updates',
//             'Get notified about app updates and new features.',
//             _newUpdates,
//                 (value) {
//               setState(() {
//                 _newUpdates = value;
//               });
//             },
//           ),
//           _buildSwitchTile(
//             'Promotional Notifications',
//             'Receive promotional offers and discounts.',
//             _promotional,
//                 (value) {
//               setState(() {
//                 _promotional = value;
//               });
//             },
//           ),
//           _buildSectionHeader('Notification Settings'),
//           _buildSwitchTile(
//             'Notification Sound',
//             'Enable sound for notifications.',
//             _sound,
//                 (value) {
//               setState(() {
//                 _sound = value;
//               });
//             },
//           ),
//           _buildSwitchTile(
//             'Vibration',
//             'Enable vibration for notifications.',
//             _vibration,
//                 (value) {
//               setState(() {
//                 _vibration = value;
//               });
//             },
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: _generateNotification,
//             child: Text('Test Notification'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   Widget _buildSwitchTile(String title, String subtitle, bool value, Function(bool) onChanged) {
//     return SwitchListTile(
//       title: Text(title),
//       subtitle: Text(subtitle),
//       value: value,
//       onChanged: onChanged,
//       activeColor: Colors.blue,
//     );
//   }
//
//   // Function to simulate generating a notification
//   void _generateNotification() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text('New notification: Data has been updated!'),
//         duration: Duration(seconds: 3),
//       ),
//     );
//     // Add functionality to trigger local or FCM notifications here.
//   }
// }


// Privacy Page
class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Privacy Policy',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Effective Date: [1 Dec 2024]',
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            _buildSection(
              'Introduction',
              'Your privacy is important to us. This Privacy Policy explains how we collect, use, and protect your information when you use our app.',
            ),
            const SizedBox(height: 10),
            _buildSection(
              'Information We Collect',
              'We may collect the following types of information:\n'
                  '1. Personal Information: Name, email address, phone number, etc.\n'
                  '2. Usage Data: Information about how you interact with the app.\n'
                  '3. Device Information: Device type, operating system, and app version.',
            ),
            const SizedBox(height: 10),
            _buildSection(
              'How We Use Your Information',
              'We use your information to:\n'
                  '1. Provide and improve our services.\n'
                  '2. Respond to your inquiries and provide support.\n'
                  '3. Personalize your app experience.',
            ),
            const SizedBox(height: 10),
            _buildSection(
              'How We Protect Your Information',
              'We implement industry-standard security measures to protect your information. However, no method of transmission over the internet or electronic storage is 100% secure.',
            ),
            const SizedBox(height: 10),
            _buildSection(
              'Sharing Your Information',
              'We do not sell your personal information. We may share your information with third parties for the following purposes:\n'
                  '1. To comply with legal obligations.\n'
                  '2. To provide services through trusted partners.',
            ),
            const SizedBox(height: 10),
            _buildSection(
              'Your Rights',
              'You have the right to:\n'
                  '1. Access, update, or delete your personal information.\n'
                  '2. Opt-out of receiving marketing communications.\n'
                  '3. Request a copy of the information we have about you.',
            ),
            const SizedBox(height: 10),
            _buildSection(
              'Changes to This Privacy Policy',
              'We may update this Privacy Policy from time to time. We will notify you of any changes by updating the effective date at the top of this page.',
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Us',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'If you have any questions about this Privacy Policy, please contact us at:\n'
                  'Email: support@appname.com\n'
                  'Phone: +91 ',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }
}

// Help & Support Page
class HelpSupportPage extends StatefulWidget {
  const HelpSupportPage({super.key});

  @override
  _HelpSupportPageState createState() => _HelpSupportPageState();
}

class _HelpSupportPageState extends State<HelpSupportPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _complaintController = TextEditingController();

  final List<Map<String, String>> _faqs = [
    {'question': 'How do I reset my password?', 'answer': 'Go to settings and select "Reset Password".'},
    {'question': 'Where can I view my order history?', 'answer': 'You can view your order history in the "Orders" section.'},
    {'question': 'How do I contact support?', 'answer': 'You can contact support via the complaint form on this page.'},
  ];

  Future<void> _submitComplaint() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('complaints').add({
          'name': _nameController.text,
          'email': _emailController.text,
          'complaint': _complaintController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Clear the form
        _nameController.clear();
        _emailController.clear();
        _complaintController.clear();

        // Show success message
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Thank You!'),
            content: const Text('Thank you for your valuable feedback.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error submitting complaint: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Complaint Form
            const Text(
              'Submit a Complaint',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _complaintController,
                    decoration: const InputDecoration(
                      labelText: 'Complaint',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your complaint';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitComplaint,
                    child: const Text('Submit Complaint'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // FAQ Section
            const Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _faqs.length,
              itemBuilder: (context, index) {
                final faq = _faqs[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ExpansionTile(
                    title: Text(
                      faq['question']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          faq['answer']!,
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:flutter/material.dart';
//
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   bool _isDarkMode = false;
//   String _selectedLanguage = 'English';
//   final List<String> _languages = ['English', 'Marathi', 'Hindi'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[50],
//       appBar: AppBar(
//         title: Text('Settings'),
//         centerTitle: true,
//         backgroundColor: Colors.blue[50],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             // Change Language Section
//             // _buildSectionHeader('Change Language'),
//             // _buildLanguageDropdown(),
//             // SizedBox(height: 20),
//
//             // Change Theme Section
//             _buildSectionHeader('Change Theme'),
//             _buildThemeSwitch(),
//             SizedBox(height: 20),
//
//             // Additional Settings Section
//             _buildSectionHeader('Additional Settings'),
//             _buildListTile(Icons.notifications, 'Notifications', () {
//               // Handle Notifications
//             }),
//             _buildListTile(Icons.security, 'Privacy', () {
//               // Handle Privacy
//             }),
//             _buildListTile(Icons.help, 'Help & Support', () {
//
//               // Handle Help & Support
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   Widget _buildLanguageDropdown() {
//     return DropdownButtonFormField<String>(
//       value: _selectedLanguage,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         filled: true,
//         fillColor: Colors.grey[200],
//         labelText: 'Select Language',
//       ),
//       onChanged: (String? newValue) {
//         setState(() {
//           _selectedLanguage = newValue!;
//         });
//       },
//       items: _languages.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
//
//   Widget _buildThemeSwitch() {
//     return SwitchListTile(
//       title: Text('Dark Mode'),
//       value: _isDarkMode,
//       onChanged: (bool value) {
//         setState(() {
//           _isDarkMode = value;
//         });
//         // Implement theme change logic here
//       },
//       secondary: Icon(_isDarkMode ? Icons.dark_mode : Icons.light_mode),
//     );
//   }
//
//   Widget _buildListTile(IconData icon, String title, Function() onTap) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.blue),
//       title: Text(title),
//       onTap: onTap,
//       trailing: Icon(Icons.arrow_forward_ios, size: 16),
//     );
//   }
// }
