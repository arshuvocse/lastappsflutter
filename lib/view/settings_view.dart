
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // This sets the back arrow color
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: const [
          SettingsListItem(
            icon: Icons.person_outline,
            title: 'User Name', // Changed from Profile to User Name
            subtitle: 'View or edit your profile details',
            isHeader: true, 
          ),
          SettingsListItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            subtitle: 'Update your account password',
          ),
          SettingsListItem(
            icon: Icons.notifications_none,
            title: 'Notifications',
            subtitle: 'Manage push and email notifications',
          ),
          SettingsListItem(
            icon: Icons.info_outline,
            title: 'About App',
            subtitle: 'Version info and app details',
          ),
        ],
      ),
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isHeader;

  const SettingsListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isHeader = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF2B6F5C),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white, size: isHeader ? 32 : 24),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: isHeader ? 18 : 16,
          ),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.chevron_right, color: Colors.white),
        onTap: () {
          // Handle navigation
        },
      ),
    );
  }
}
