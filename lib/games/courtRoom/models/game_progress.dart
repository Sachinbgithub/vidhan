import 'case_history.dart';
import 'difficulty_level.dart';

class GameProgress {
  final int totalCasesPlayed;
  final int correctVerdicts;
  final int totalScore;
  final Map<DifficultyLevel, int> casesPerDifficulty;
  final List<CaseHistory> recentCases;
  final Map<String, int> constitutionalArticleStats;

  GameProgress({
    required this.totalCasesPlayed,
    required this.correctVerdicts,
    required this.totalScore,
    required this.casesPerDifficulty,
    required this.recentCases,
    required this.constitutionalArticleStats,
  });

  double get accuracyRate =>
      totalCasesPlayed > 0 ? (correctVerdicts / totalCasesPlayed) * 100 : 0;
}