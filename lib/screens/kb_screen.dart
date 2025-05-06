// File: lib/screens/kb_screen.dart
// Purpose: Stub screen for Knowledge Base viewing and search (static for now)
// ───────────────────────────────────────────────────────────────────────────
// CHANGELOG:
// [2025-05-06] Initial stub with list of mock KB articles and screen layout.

import 'package:flutter/material.dart';

class KbScreen extends StatelessWidget {
  const KbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> kbArticles = [
      {
        'title': 'How to clear cache in Epicor',
        'source': 'Epicor',
        'summary': 'Steps to reset user cache without restarting the system.'
      },
      {
        'title': 'Infor: Common Security Errors',
        'source': 'Infor',
        'summary': 'What to check when login fails due to role mismatches.'
      },
      {
        'title': 'Sage Journal Reversals',
        'source': 'Sage',
        'summary': 'A quick guide to reversing posted journals cleanly.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Knowledge Base'),
      ),
      body: ListView.separated(
        itemCount: kbArticles.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final article = kbArticles[index];
          return ListTile(
            title: Text(article['title']!),
            subtitle: Text('${article['source']} • ${article['summary']}'),
            leading: const Icon(Icons.book),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped: ${article['title']}')),
              );
            },
          );
        },
      ),
    );
  }
}