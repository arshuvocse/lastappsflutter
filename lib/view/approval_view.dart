
import 'package:flutter/material.dart';

class ApprovalScreen extends StatelessWidget {
  const ApprovalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF0F4F8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: <Widget>[
            _buildIconCard(context, 'Attendance', Icons.calendar_today),
            _buildIconCard(context, 'Providers', Icons.people_outline),
            _buildIconCard(context, 'Tour Plan', Icons.location_on_outlined),
            _buildIconCard(context, 'Checklist', Icons.playlist_add_check),
            _buildIconCard(context, 'Approval', Icons.approval),
            _buildIconCard(context, 'List', Icons.list),
          ],
        ),
      ),
    );
  }

  Widget _buildIconCard(BuildContext context, String title, IconData icon) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      shadowColor: Colors.black12,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 40, color: const Color(0xFF008080)),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
