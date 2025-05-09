// lib/screens/env_status_screen.dart
// Entry point for environment status screen – refactored to use modular widgets

import 'package:flutter/material.dart';
import '../data/mock_environment_data.dart';
import '../widgets/env_group_tile.dart';
import '../models/environment_group.dart';

class EnvStatusScreen extends StatefulWidget {
  const EnvStatusScreen({super.key});

  @override
  State<EnvStatusScreen> createState() => _EnvStatusScreenState();
}

class _EnvStatusScreenState extends State<EnvStatusScreen> {
  late List<EnvironmentGroup> environments;

  @override
  void initState() {
    super.initState();
    environments = mockEnvironments;
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      environments = mockEnvironments; // Replace with API call in future
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Environment Status')),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: ListView.builder(
          itemCount: environments.length,
          itemBuilder: (context, index) {
            return EnvGroupTile(group: environments[index]);
          },
        ),
      ),
    );
  }
}