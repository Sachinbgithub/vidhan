import 'difficulty_level.dart';

class CaseHistory {
  final String caseId;
  final String title;
  final DateTime datePlayed;
  final String selectedVerdict;
  final bool wasCorrect;
  final int scoreEarned;
  final DifficultyLevel difficulty;

  CaseHistory({
    required this.caseId,
    required this.title,
    required this.datePlayed,
    required this.selectedVerdict,
    required this.wasCorrect,
    required this.scoreEarned,
    required this.difficulty,
  });
}