import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  String _selectedLanguage = 'English';
  final List<String> _languages = ['English', 'Marathi', 'Hindi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Change Language Section
            _buildSectionHeader('Change Language'),
            _buildLanguageDropdown(),
            SizedBox(height: 20),

            // Change Theme Section
            _buildSectionHeader('Change Theme'),
            _buildThemeSwitch(),
            SizedBox(height: 20),

            // Additional Settings Section
            _buildSectionHeader('Additional Settings'),
            _buildListTile(Icons.notifications, 'Notifications', () {
              // Handle Notifications
            }),
            _buildListTile(Icons.security, 'Privacy', () {
              // Handle Privacy
            }),
            _buildListTile(Icons.help, 'Help & Support', () {
              // Handle Help & Support
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
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildLanguageDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedLanguage,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
        labelText: 'Select Language',
      ),
      onChanged: (String? newValue) {
        setState(() {
          _selectedLanguage = newValue!;
        });
      },
      items: _languages.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildThemeSwitch() {
    return SwitchListTile(
      title: Text('Dark Mode'),
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
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}