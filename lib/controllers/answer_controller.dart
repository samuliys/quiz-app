import 'package:get/get.dart';
import 'package:quiz_app/services/answer_service.dart';
import 'package:quiz_app/models/answer.dart';

class AnswerController {
  final service = Get.find<AnswerService>();

  RxList answers;

  AnswerController() : answers = [].obs {
    answers.value = service.answers;
  }

  void addAnswer(int questionId, int selectedOptionIndex, bool isCorrect) {
    final answer = Answer(questionId, selectedOptionIndex, isCorrect);
    service.addAnswer(answer);
    answers.add(answer);
  }

  int get numAnswers => answers.length;
  int get correctAnswers => answers.where((a) => a.isCorrect).length;
  int get incorrectAnswers => answers.where((a) => !a.isCorrect).length;
}
