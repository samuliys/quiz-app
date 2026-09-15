import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/widgets/layout_scaffold.dart';
import 'package:quiz_app/widgets/quiz_view.dart';

class QuestionScreen extends StatelessWidget {
  final quizController = Get.find<QuizController>();
  final questionController = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      title: 'Questions',
      body: Obx(() {
        if (quizController.question.value == null) {
          return Center(
            child: Column(
              children: [
                questionController.numQuestions == 0
                    ? Text("No questions added. Please add questions first.")
                    : Column(
                        spacing: 20,
                        children: [
                          Text(
                            "${questionController.numQuestions} questions available",
                          ),
                          FilledButton(
                            onPressed: () =>
                                quizController.loadRandomQuestion(),
                            child: Text("Start answering questions"),
                          ),
                        ],
                      ),
              ],
            ),
          );
        }
        return QuizView(question: quizController.question.value!);
      }),
    );
  }
}
