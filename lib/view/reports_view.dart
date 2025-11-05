
import 'package:flutter/material.dart';
import 'package:myapp/widgets/settings_list_item.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          SettingsListItem(
            icon: Icons.bar_chart,
            title: 'Sales Report',
            subtitle: 'View and analyze sales performance',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.timeline,
            title: 'Activity Report',
            subtitle: 'Track user and system activity',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.inventory,
            title: 'Inventory Report',
            subtitle: 'Check stock levels and inventory status',
            onTap: () {},
          ),
          SettingsListItem(
            icon: Icons.star_border,
            title: 'Performance Report',
            subtitle: 'Review team and individual performance',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
