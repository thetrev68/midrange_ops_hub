// File: lib/screens/home_screen.dart
// Purpose: Hub navigation screen for MidRange OpsHub features
// ------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-08] 🏠 Created reusable HomeScreen widget with navigation tiles.

import 'package:flutter/material.dart';
import 'tickets_screen.dart';
import 'kb_screen.dart';
import 'env_status_screen.dart';
import 'change_requests_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/nov_logo.png', height: 32),
            const SizedBox(width: 10),
            const Text('MidRange OpsHub'),
          ],
        ),
      ),
      body: ListView(
        children: [
          _buildTile(context, 'Tickets', Icons.assignment, const TicketsScreen()),
          _buildTile(context, 'Knowledge Base', Icons.book, const KbScreen()),
          _buildTile(context, 'Environment Status', Icons.cloud, const EnvStatusScreen()),
          _buildTile(context, 'Change Requests', Icons.change_circle, const ChangeRequestsScreen()),
        ],
      ),
    );
  }

  Widget _buildTile(BuildContext context, String title, IconData icon, Widget screen) {
    return ListTile(
      leading: Icon(icon, size: 32),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
    );
  }
}