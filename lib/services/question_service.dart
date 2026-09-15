import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:quiz_app/models/question.dart';

class QuestionService {
  final storage = Hive.box("storage");

  get questions {
    if (!storage.containsKey('questions')) return [];
    var data = storage.get('questions');
    if (data == null) return [];
    return data.map((json) => Question.fromJson(json)).toList();
  }

  void addQuestion(Question question) {
    var allQuestions = questions..add(question);
    storage.put('questions', allQuestions.map((q) => q.toJson()).toList());
  }

  void deleteQuestion(Question question) {
    var allQuestions = questions..removeWhere((q) => q.id == question.id);
    storage.put('questions', allQuestions.map((q) => q.toJson()).toList());
  }

  void editQuestion(Question question) {
    var allQuestions = questions;
    int index = allQuestions.indexWhere((q) => q.id == question.id);
    if (index != -1) {
      allQuestions[index] = question;
      storage.put('questions', allQuestions.map((q) => q.toJson()).toList());
    }
  }
}
