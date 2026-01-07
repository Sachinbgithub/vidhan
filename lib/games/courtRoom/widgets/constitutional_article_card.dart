
// widgets/constitutional_article_card.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/constitutional_article.dart';

class ConstitutionalArticleCard extends StatelessWidget {
  final ConstitutionalArticle article;
  final bool isExpanded;
  final VoidCallback onTap;

  const ConstitutionalArticleCard({
    super.key,
    required this.article,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Article ${article.number} - ${article.title}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: onTap,
            ),
          ),
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(article.description),
                  const SizedBox(height: 16),
                  const Text(
                    'Key Points:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...article.keyPoints.map(
                        (point) => Padding(
                      padding: const EdgeInsets.only(left: 16, top: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.circle, size: 8),
                          const SizedBox(width: 8),
                          Expanded(child: Text(point)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Examples:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ...article.examples.map(
                        (example) => Padding(
                      padding: const EdgeInsets.only(left: 16, top: 4),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_right),
                          const SizedBox(width: 8),
                          Expanded(child: Text(example)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}