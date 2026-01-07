// widgets/evidence_card.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/evidence_detail.dart';

class EvidenceCard extends StatefulWidget {
  final EvidenceDetail evidence;

  const EvidenceCard({super.key, required this.evidence});

  @override
  State<EvidenceCard> createState() => _EvidenceCardState();
}

class _EvidenceCardState extends State<EvidenceCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          children: [
            ListTile(
              leading: Icon(_getIconForType(widget.evidence.type)),
              title: Text(widget.evidence.title),
              subtitle: Text(widget.evidence.source),
              trailing: IconButton(
                icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () => setState(() => _isExpanded = !_isExpanded),
              ),
            ),
            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.evidence.description),
                    const SizedBox(height: 8),
                    Text(
                      'Submitted: ${_formatDate(widget.evidence.dateSubmitted)}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    if (widget.evidence.additionalInfo.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      const Text(
                        'Additional Information:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      ...widget.evidence.additionalInfo.entries.map(
                            (e) => Text('${e.key}: ${e.value}'),
                      ),
                    ],
                  ],
                ),
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'document':
        return Icons.description;
      case 'image':
        return Icons.image;
      case 'testimony':
        return Icons.record_voice_over;
      default:
        return Icons.attachment;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
