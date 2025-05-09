// File: lib/main.dart
// Purpose: App entry point and home screen for MidRange OpsHub
// ───────────────────────────────────────────────────────────────────────────
// CHANGELOG:
// [2025-05-06] Added navigation to TicketsScreen, KbScreen, EnvStatusScreen, and ChangeRequestsScreen.
// [2025-05-08] Updated app title and logo, added feature tiles for each screen.
// [2025-05-08] Integrated dotenv for environment variable management, added error handling for navigation.
// [2025-05-09] Modified main() so app doesn't crash if .env is missing

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/tickets_screen.dart';
import 'screens/kb_screen.dart';
import 'screens/env_status_screen.dart';
import 'screens/change_requests_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint('Warning: .env file not found or failed to load — proceeding with defaults.');
  }

  runApp(const MidRangeOpsHubApp());
}

class MidRangeOpsHubApp extends StatelessWidget {
  const MidRangeOpsHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MidRange OpsHub',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

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
          _buildFeatureTile(context, 'Tickets', Icons.assignment, 'View and manage Jira tickets'),
          _buildFeatureTile(context, 'Knowledge Base', Icons.book, 'Search and read KB articles'),
          _buildFeatureTile(context, 'Environment Status', Icons.cloud, 'Check ERP environment health'),
          _buildFeatureTile(context, 'Change Requests', Icons.change_circle, 'Submit and review change requests'),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(BuildContext context, String title, IconData icon, String subtitle) {
    return ListTile(
      leading: Icon(icon, size: 32),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        if (title == 'Tickets') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TicketsScreen()),
          );
        } else if (title == 'Knowledge Base') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KbScreen()),
          );
        } else if (title == 'Environment Status') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EnvStatusScreen()),
          );
        } else if (title == 'Change Requests') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChangeRequestsScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Coming soon: $title')));
        }
      },
    );
  }
}