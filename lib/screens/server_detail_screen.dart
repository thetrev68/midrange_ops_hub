// lib/screens/server_detail_screen.dart
// Cleaned-up version of server detail screen with fixed structure and charts

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/server_status.dart';
import '../utils/status_chip.dart';

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
    final memoryHistory = List.generate(24, (i) => 2.0 + Random().nextDouble() * 6.0);
    final diskHistory = List.generate(24, (i) => 40 + Random().nextDouble() * 50);

    return Scaffold(
      appBar: AppBar(title: Text(server.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
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
            SizedBox(height: 200, child: _buildLineChart(cpuHistory, Colors.blue)),
            const SizedBox(height: 24),
            const Text('Memory Usage - Last 24 Hours:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: _buildLineChart(memoryHistory, Colors.green)),
            const SizedBox(height: 24),
            const Text('Disk Usage - Last 24 Hours:', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 200, child: _buildLineChart(diskHistory, Colors.orange)),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart(List<double> history, Color color) {
    final data = List.generate(24, (i) => FlSpot(i.toDouble(), history[i]));
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: data,
            isCurved: true,
            color: color,
            barWidth: 2,
            belowBarData: BarAreaData(show: false),
            dotData: FlDotData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 22),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 28),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: true),
      ),
    );
  }
}
