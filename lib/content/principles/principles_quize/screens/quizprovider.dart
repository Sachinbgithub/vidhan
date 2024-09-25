
import 'package:flutter/cupertino.dart';

import '../../../../games/quize/models/question.dart';

class QuizProvider extends ChangeNotifier {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int? _selectedAnswerIndex;

  List<Question> _questions;

  QuizProvider(this._questions);

  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;
  int? get selectedAnswerIndex => _selectedAnswerIndex;
  List<Question> get questions => _questions;

  void selectAnswer(int index) {
    _selectedAnswerIndex = index;
    final question = _questions[_currentQuestionIndex];
    if (_selectedAnswerIndex == question.correctAnswerIndex) {
      _score++;
    }
    notifyListeners();
  }

  void goToNextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      _selectedAnswerIndex = null;
      notifyListeners();
    }
  }

  void reset() {
    _currentQuestionIndex = 0;
    _score = 0;
    _selectedAnswerIndex = null;
    notifyListeners();
  }
}