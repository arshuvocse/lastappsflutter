
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
        children: [
          const SettingsListItem(
            icon: Icons.person_outline,
            title: 'User Name', // Changed from Profile to User Name
            subtitle: 'View or edit your profile details',
            isHeader: true, 
          ),
          const SettingsListItem(
            icon: Icons.lock_outline,
            title: 'Change Password',
            subtitle: 'Update your account password',
          ),
          const SettingsListItem(
            icon: Icons.notifications_none,
            title: 'Notifications',
            subtitle: 'Manage push and email notifications',
          ),
          const SettingsListItem(
            icon: Icons.info_outline,
            title: 'About App',
            subtitle: 'Version info and app details',
          ),
          SettingsListItem(
            icon: Icons.logout,
            title: 'Logout',
            subtitle: 'Sign out of your account',
            onTap: () => _showLogoutConfirmation(context),
          ),
        ],
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop();
                // Perform logout action here
              },
            ),
          ],
        );
      },
    );
  }
}

class SettingsListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isHeader;
  final VoidCallback? onTap;

  const SettingsListItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isHeader = false,
    this.onTap,
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
        onTap: onTap,
      ),
    );
  }
}
