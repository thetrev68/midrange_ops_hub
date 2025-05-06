import 'package:flutter/material.dart';

void main() => runApp(const MidRangeOpsHubApp());

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
        // Navigation placeholder
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Coming soon: $title')));
      },
    );
  }
}