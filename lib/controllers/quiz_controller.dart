import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/answer_controller.dart';
import 'package:quiz_app/models/question.dart';

class QuizController {
  final questionController = Get.find<QuestionController>();
  final answerController = Get.find<AnswerController>();

  Rxn<Question> question;

  QuizController() : question = Rxn<Question>() {
    question.value = null;
  }

  var selectedAnswerIndex = (-1).obs;

  void loadRandomQuestion() {
    if (questionController.questions.isEmpty) return;

    selectedAnswerIndex.value = -1;

    Question? newQuestion;
    do { // choose question that is not the current one
      newQuestion = questionController.getRandomQuestion();
    } while (questionController.numQuestions > 1 &&
        newQuestion!.id == question.value?.id);
    question.value = newQuestion;
  }

  void selectAnswer(int questionId, int index, int correctOption) {
    selectedAnswerIndex.value = index;
    bool isCorrect = index == correctOption;

    answerController.addAnswer(questionId, index, isCorrect);

    if (isCorrect) {
      questionController.completeQuestion(question.value!);
    }
  }

  void exitQuiz() {
    question.value = null;
    selectedAnswerIndex.value = -1;
  }

  bool answeredCorrectly() {
    if (!answerSelected || question.value == null) return false;
    return selectedAnswerIndex.value == question.value!.correctOption;
  }

  bool get answerSelected => selectedAnswerIndex.value != -1;
}
