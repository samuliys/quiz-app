import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:quiz_app/models/answer.dart';

class AnswerService {
  final storage = Hive.box("storage");

  get answers {
    if (!storage.containsKey('answers')) return [];
    var data = storage.get('answers');
    if (data == null) return [];
    return data.map((json) => Answer.fromJson(json)).toList();
  }

  void addAnswer(Answer answer) {
    var allAnswers = answers..add(answer);
    storage.put('answers', allAnswers.map((a) => a.toJson()).toList());
  }
}