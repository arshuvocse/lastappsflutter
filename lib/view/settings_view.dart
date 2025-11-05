
import 'package:flutter/material.dart';
import 'package:myapp/widgets/settings_list_item.dart';

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
