// lib/screens/server_detail_screen.dart
// Page showing details for a specific server

import 'dart:math';
import 'package:flutter/material.dart';
import '../models/server_status.dart';
import '../utils/status_chip.dart';

import 'package:fl_chart/fl_chart.dart';

class ServerDetailScreen extends StatelessWidget {
  final ServerStatus server;

  const ServerDetailScreen({super.key, required this.server});

  String _generateUptime() {
    final days = Random().nextInt(90) + 10;
    final hours = Random().nextInt(24);
    final minutes = Random().nextInt(60);
    return '$days days, $hours hrs, $minutes min';
  }

  DateTime _generateLastRestart() {
    return DateTime.now().subtract(Duration(days: Random().nextInt(60) + 1));
  }

  @override
  Widget build(BuildContext context) {
    final uptime = _generateUptime();
    final lastRestart = _generateLastRestart();
    final cpuHistory = List.generate(24, (i) => Random().nextDouble() * 100);

    return Scaffold(
      appBar: AppBar(title: Text(server.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status', style: Theme.of(context).textTheme.titleMedium),
                buildStatusChip(server.status),
              ],
            ),
            const SizedBox(height: 16),
            Text('Role: ${server.role.name.toUpperCase()}'),
            Text('IP Address: ${server.ip}'),
            Text('Last Checked: ${server.lastChecked.toLocal()}'),
            const SizedBox(height: 24),
            const Text('Details:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('• Uptime: $uptime'),
            Text('• Last Restart: ${lastRestart.toLocal()}'),
            const Text('• CPU Load: 22%'),
            const Text('• Memory Usage: 3.2 GB / 8 GB'),
            const Text('• Disk Usage: 65%'),
            const SizedBox(height: 24),
            const Text('CPU Load - Last 24 Hours:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 200,
              child: _buildCpuChart(),
            ),
            const SizedBox(height: 24),
            const Text('Memory Usage - Last 24 Hours:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 200,
              child: _buildMemoryChart(memoryHistory),
            ),
            const SizedBox(height: 24),
            const Text('Disk Usage - Last 24 Hours:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              height: 200,
              child: _buildDiskChart(diskHistory),
            ),
          ],
        ),
      ),
    );
  }
}