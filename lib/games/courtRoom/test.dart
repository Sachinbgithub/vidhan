import 'package:flutter/material.dart';

// Data Models
class Case {
  final String title;
  final String background;
  final List<String> evidence;
  final List<String> prosecution;
  final List<String> defense;
  final List<VerdictOption> verdictOptions;
  final String correctVerdict;
  final String explanation;
  final String constitutionalReference;

  Case({
    required this.title,
    required this.background,
    required this.evidence,
    required this.prosecution,
    required this.defense,
    required this.verdictOptions,
    required this.correctVerdict,
    required this.explanation,
    required this.constitutionalReference,
  });
}

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

class CourtroomGame extends StatefulWidget {
  const CourtroomGame({super.key});

  @override
  State<CourtroomGame> createState() => _CourtroomGameState();
}

class _CourtroomGameState extends State<CourtroomGame> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedVerdict;
  bool isVerdictSubmitted = false;
  int currentScore = 0;

  // Sample case data
  final Case currentCase = Case(
    title: "Small Town Entrepreneur vs Government Grant Authority",
    background: "Ravi, a young entrepreneur from a small town, applies for a government grant...",
    evidence: [
      "Grant application documents",
      "Similar approved applications from larger cities",
      "Rejection letter without proper justification",
      "Local business development statistics"
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
    constitutionalReference: "Article 14 - Equality before law",
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
        currentScore += 100;
      }
    });
  }

  Widget _buildCaseBackground() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentCase.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              currentCase.background,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              currentCase.constitutionalReference,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEvidence() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: currentCase.evidence.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            leading: const Icon(Icons.description),
            title: Text(currentCase.evidence[index]),
            onTap: () {
              // TODO: Show detailed evidence view
            },
          ),
        );
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
            ElevatedButton(
              onPressed: selectedVerdict == null ? null : _submitVerdict,
              child: const Text('Submit Verdict'),
            ),
          if (isVerdictSubmitted) ...[
            const SizedBox(height: 16),
            Text(
              selectedVerdict == currentCase.correctVerdict
                  ? 'Correct! Well done.'
                  : 'Incorrect. Review the explanation:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selectedVerdict == currentCase.correctVerdict
                    ? Colors.green
                    : Colors.red,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              currentCase.explanation,
              style: const TextStyle(fontSize: 16),
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