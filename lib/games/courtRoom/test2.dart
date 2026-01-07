import 'package:flutter/material.dart';
import 'models/difficulty_level.dart';
import 'models/constitutional_article.dart';
import 'models/evidence_detail.dart';


// class Case {
//   final String title;
//   final String background;
//   final List<EvidenceDetail> evidence;
//   final List<String> prosecution;
//   final List<String> defense;
//   final List<VerdictOption> verdictOptions;
//   final String correctVerdict;
//   final String explanation;
//   final String constitutionalReference;
//   final DifficultyLevel difficulty;
//   final int baseScore;
//
//   Case({
//     required this.title,
//     required this.background,
//     required this.evidence,
//     required this.prosecution,
//     required this.defense,
//     required this.verdictOptions,
//     required this.correctVerdict,
//     required this.explanation,
//     required this.constitutionalReference,
//     this.difficulty = DifficultyLevel.beginner,
//     this.baseScore = 100,
//   });
// }

// Update your existing Case model
class Case {
  final String id;
  final String title;
  final String background;
  final List<EvidenceDetail> evidence;
  final List<String> prosecution;
  final List<String> defense;
  final List<VerdictOption> verdictOptions;
  final String correctVerdict;
  final String explanation;
  final ConstitutionalArticle constitutionalArticle;
  final DifficultyLevel difficulty;
  final int baseScore;
  final Map<String, String> additionalResources;
  final List<String> relatedCases;

  Case({
    required this.id,
    required this.title,
    required this.background,
    required this.evidence,
    required this.prosecution,
    required this.defense,
    required this.verdictOptions,
    required this.correctVerdict,
    required this.explanation,
    required this.constitutionalArticle,
    required this.difficulty,
    required this.baseScore,
    this.additionalResources = const {},
    this.relatedCases = const [],
  });
}
// class EvidenceDetail {
//   final String title;
//   final String description;
//   final String type;
//   final DateTime dateSubmitted;
//
//   EvidenceDetail({
//     required this.title,
//     required this.description,
//     required this.type,
//     required this.dateSubmitted,
//   });
// }

class VerdictOption {
  final String id;
  final String verdict;
  final String explanation;

  VerdictOption({
    required this.id,
    required this.verdict,
    required this.explanation,
  });
}

class CourtroomGameTest extends StatefulWidget {
  const CourtroomGameTest({super.key});

  @override
  State<CourtroomGameTest> createState() => _CourtroomGameTestState();
}

class _CourtroomGameTestState extends State<CourtroomGameTest> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedVerdict;
  bool isVerdictSubmitted = false;
  int currentScore = 0;
  bool isEvidenceExpanded = false;

  // Sample case data
  // final Case currentCase = Case(
  //   title: "Small Town Entrepreneur vs Government Grant Authority",
  //   background: "Ravi, a young entrepreneur from a small town, applies for a government grant...",
  //   evidence: [
  //     EvidenceDetail(
  //       title: "Grant application documents",
  //       description: "Detailed application submitted by Ravi showing all qualifications",
  //       type: "document",
  //       dateSubmitted: DateTime.now(),
  //     ),
  //     EvidenceDetail(
  //       title: "Similar approved applications",
  //       description: "Applications from larger cities that were approved",
  //       type: "document",
  //       dateSubmitted: DateTime.now(),
  //     ),
  //     EvidenceDetail(
  //       title: "Rejection letter",
  //       description: "Official rejection letter without proper justification",
  //       type: "document",
  //       dateSubmitted: DateTime.now(),
  //     ),
  //   ],
  //   prosecution: [
  //     "Discrimination based on geographical location",
  //     "Violation of Article 14 of Constitution",
  //     "Pattern of bias against small town applications"
  //   ],
  //   defense: [
  //     "Limited resources and budget constraints",
  //     "Different evaluation criteria for different regions",
  //     "No intentional discrimination"
  //   ],
  //   verdictOptions: [
  //     VerdictOption(
  //         id: "1",
  //         verdict: "Grant the petition and direct authorities to reconsider the application",
  //         explanation: "This ensures equal treatment and fair consideration"
  //     ),
  //     VerdictOption(
  //         id: "2",
  //         verdict: "Dismiss the petition but issue guidelines for transparency",
  //         explanation: "Balances administrative discretion with fairness"
  //     ),
  //     VerdictOption(
  //         id: "3",
  //         verdict: "Dismiss the petition entirely",
  //         explanation: "Authorities have discretionary powers in grant allocation"
  //     ),
  //   ],
  //   correctVerdict: "1",
  //   explanation: "Article 14 guarantees equality before law and prohibits discrimination based on place of origin",
  //   constitutionalReference: "Article 14 - Equality before law",
  //   difficulty: DifficultyLevel.beginner,
  // );
  // Enhanced case data with new models
  final Case currentCase = Case(
    id: "case_001",
    title: "Small Town Entrepreneur vs Government Grant Authority",
    background: "Ravi, a young entrepreneur from a small town...",
    evidence: [
      EvidenceDetail(
        title: "Grant Application Documents",
        description: "Official application submitted by Ravi showing all requirements were met.",
        type: "document",
        source: "Government Records",
        dateSubmitted: DateTime(2024, 1, 15),
        relatedArticles: ["14"],
        additionalInfo: {
          "Application ID": "GA2024015",
          "Status": "Rejected",
        },
      ),
      EvidenceDetail(
        title: "Similar Approved Applications",
        description: "Collection of approved applications from larger cities with similar criteria.",
        type: "document",
        source: "RTI Response",
        dateSubmitted: DateTime(2024, 1, 20),
        relatedArticles: ["14"],
        additionalInfo: {
          "Total Cases": "15",
          "Time Period": "Last 6 months",
        },
      ),
    ],
    prosecution: [
      "Discrimination based on geographical location",
      "Violation of Article 14 of Constitution",
      "Pattern of bias against small town applications"
    ],
    defense: [
      "Limited resources and budget constraints",
      "Different evaluation criteria for different regions",
      "No intentional discrimination"
    ],
    verdictOptions: [
      VerdictOption(
          id: "1",
          verdict: "Grant the petition and direct authorities to reconsider the application",
          explanation: "This ensures equal treatment and fair consideration"
      ),
      VerdictOption(
          id: "2",
          verdict: "Dismiss the petition but issue guidelines for transparency",
          explanation: "Balances administrative discretion with fairness"
      ),
      VerdictOption(
          id: "3",
          verdict: "Dismiss the petition entirely",
          explanation: "Authorities have discretionary powers in grant allocation"
      ),
    ],
    correctVerdict: "1",
    explanation: "Article 14 guarantees equality before law and prohibits discrimination based on place of origin",
    constitutionalArticle: ConstitutionalArticle(
      number: "14",
      title: "Right to Equality",
      description: "The State shall not deny to any person equality before the law or the equal protection of the laws within the territory of India.",
      keyPoints: [
        "Equality before law",
        "Equal protection of laws",
        "Prohibition of discrimination",
      ],
      examples: [
        "Government policies must treat all citizens equally",
        "Different treatment must be based on reasonable classification",
      ],
    ),
    difficulty: DifficultyLevel.beginner,
    baseScore: 100,
  );


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _submitVerdict() {
    if (selectedVerdict == null) return;

    setState(() {
      isVerdictSubmitted = true;
      if (selectedVerdict == currentCase.correctVerdict) {
        currentScore += currentCase.baseScore;
      }
    });
  }

  Widget _buildEvidenceCard(EvidenceDetail evidence) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          leading: Icon(_getEvidenceIcon(evidence.type)),
          title: Text(evidence.title),
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(evidence.description),
                  const SizedBox(height: 8),
                  Text(
                    'Submitted: ${evidence.dateSubmitted.toString().split(' ')[0]}',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getEvidenceIcon(String type) {
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

  Widget _buildCaseBackground() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    currentCase.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Chip(
                  label: Text(currentCase.difficulty.name),
                  backgroundColor: _getDifficultyColor(currentCase.difficulty),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              currentCase.background,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.gavel, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    currentCase.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getDifficultyColor(DifficultyLevel difficulty) {
    switch (difficulty) {
      case DifficultyLevel.beginner:
        return Colors.green[100]!;
      case DifficultyLevel.intermediate:
        return Colors.orange[100]!;
      case DifficultyLevel.advanced:
        return Colors.red[100]!;
    }
  }

  Widget _buildEvidence() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: currentCase.evidence.length,
      itemBuilder: (context, index) {
        return _buildEvidenceCard(currentCase.evidence[index]);
      },
    );
  }

  Widget _buildArguments() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildArgumentSection("Prosecution Arguments", currentCase.prosecution, Colors.red[100]!),
          const SizedBox(height: 16),
          _buildArgumentSection("Defense Arguments", currentCase.defense, Colors.blue[100]!),
        ],
      ),
    );
  }

  Widget _buildArgumentSection(String title, List<String> arguments, Color color) {
    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            ...arguments.map((arg) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(Icons.arrow_right),
                  const SizedBox(width: 8),
                  Expanded(child: Text(arg)),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildVerdict() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ...currentCase.verdictOptions.map((option) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            color: selectedVerdict == option.id
                ? Colors.blue[100]
                : null,
            child: RadioListTile(
              title: Text(option.verdict),
              subtitle: isVerdictSubmitted ? Text(option.explanation) : null,
              value: option.id,
              groupValue: selectedVerdict,
              onChanged: isVerdictSubmitted
                  ? null
                  : (value) => setState(() => selectedVerdict = value as String),
            ),
          )),
          const SizedBox(height: 16),
          if (!isVerdictSubmitted)
            ElevatedButton.icon(
              onPressed: selectedVerdict == null ? null : _submitVerdict,
              icon: const Icon(Icons.gavel),
              label: const Text('Submit Verdict'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          if (isVerdictSubmitted) ...[
            const SizedBox(height: 16),
            Card(
              color: selectedVerdict == currentCase.correctVerdict
                  ? Colors.green[50]
                  : Colors.red[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      selectedVerdict == currentCase.correctVerdict
                          ? Icons.check_circle
                          : Icons.error,
                      size: 48,
                      color: selectedVerdict == currentCase.correctVerdict
                          ? Colors.green
                          : Colors.red,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      selectedVerdict == currentCase.correctVerdict
                          ? 'Correct! Well done.'
                          : 'Incorrect. Review the explanation:',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      currentCase.explanation,
                      style: const TextStyle(fontSize: 16),
                    ),
                    if (selectedVerdict == currentCase.correctVerdict) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Score: +${currentCase.baseScore}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Courtroom'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.description), text: 'Case'),
            Tab(icon: Icon(Icons.search), text: 'Evidence'),
            Tab(icon: Icon(Icons.people), text: 'Arguments'),
            Tab(icon: Icon(Icons.gavel), text: 'Verdict'),
          ],
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                'Score: $currentScore',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCaseBackground(),
          _buildEvidence(),
          _buildArguments(),
          _buildVerdict(),
        ],
      ),
    );
  }
}