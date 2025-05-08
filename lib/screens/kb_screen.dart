// File: lib/screens/kb_screen.dart
// Purpose: Stub screen for Knowledge Base viewing and search (static for now)
// ------------------------------------------------------------------------------
// CHANGELOG:
// [2025-05-06] Initial stub with list of mock KB articles and screen layout.
// [2025-05-08] 📖 Refactored to use typed model and added placeholder for search bar.

import 'package:flutter/material.dart';

class KbArticle {
  final String title;
  final String source;
  final String summary;

  KbArticle({required this.title, required this.source, required this.summary});
}

class KbScreen extends StatelessWidget {
  const KbScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<KbArticle> kbArticles = [
      KbArticle(
        title: 'How to clear cache in Epicor',
        source: 'Epicor',
        summary: 'Steps to reset user cache without restarting the system.',
      ),
      KbArticle(
        title: 'Infor: Common Security Errors',
        source: 'Infor',
        summary: 'What to check when login fails due to role mismatches.',
      ),
      KbArticle(
        title: 'Sage Journal Reversals',
        source: 'Sage',
        summary: 'A quick guide to reversing posted journals cleanly.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Knowledge Base'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search knowledge base...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (query) {
                // Search input (filter logic coming soon)
              },
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: ListView.separated(
              itemCount: kbArticles.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final article = kbArticles[index];
                return ListTile(
                  title: Text(article.title),
                  subtitle: Text('${article.source} • ${article.summary}'),
                  leading: const Icon(Icons.book),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  isThreeLine: true,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tapped: ${article.title}')),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}