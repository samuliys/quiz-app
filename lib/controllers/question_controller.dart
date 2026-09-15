import 'dart:math';
import 'package:get/get.dart';
import 'package:quiz_app/services/question_service.dart';
import 'package:quiz_app/models/question.dart';

class QuestionController {
  final service = Get.find<QuestionService>();

  RxList questions;

  QuestionController() : questions = [].obs {
    questions.value = service.questions;
  }

  void addQuestion(String question, List<String> options, int correctOption) {
    int id = questions.length + 1;
    service.addQuestion(Question(id, question, options, correctOption, false));
    questions.value = service.questions;
  }

  void deleteQuestion(Question question) {
    service.deleteQuestion(question);
    questions.value = service.questions;
  }

  void editQuestion(Question question) {
    service.editQuestion(question);
    questions.value = service.questions;
  }

  void completeQuestion(Question question) {
    question.completed = true;
    service.editQuestion(question);
    questions.value = service.questions;
  }

  Question? getQuestionById(int id) {
    return questions.firstWhere((q) => q.id == id, orElse: () => null);
  }

  Question? getRandomQuestion() {
    if (questions.isEmpty) return null;
    final random = Random();
    return questions[random.nextInt(questions.length)];
  }

  int get numQuestions => questions.length;
  int get numCompletedQuestions => questions.where((q) => q.completed).length;
  int get numNotCompletedQuestions =>
      questions.where((q) => !q.completed).length;
}
