import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import 'package:quiz_app/models/question.dart';

class QuizView extends StatelessWidget {
  final Question question;
  final controller = Get.find<QuizController>();

  QuizView({required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Text(
          question.question,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        OptionsView(question: question),
        ResultsView(),
      ],
    );
  }
}

class OptionsView extends StatelessWidget {
  final Question question;
  final controller = Get.find<QuizController>();

  OptionsView({required this.question});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Center(
        child: IntrinsicWidth(
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: question.options.asMap().entries.map((entry) {
              int idx = entry.key;
              return OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: controller.answerSelected
                        ? idx == question.correctOption
                              ? Colors.green
                              : controller.selectedAnswerIndex.value == idx
                              ? Colors.red
                              : null
                        : null,
                  ),
                  onPressed: controller.answerSelected
                      ? null
                      : () => controller.selectAnswer(
                          question.id,
                          idx,
                          question.correctOption,
                        ),
                  child: Text(entry.value),
                );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class ResultsView extends StatelessWidget {
  final controller = Get.find<QuizController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!controller.answerSelected) return Container();
      return Column(
        spacing: 20,
        children: [
          Text(
            controller.answeredCorrectly() ? "Correct!" : "Incorrect!",
            style: TextStyle(
              fontSize: 24,
              color: controller.answeredCorrectly() ? Colors.green : Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              ElevatedButton(
                onPressed: () {
                  controller.exitQuiz();
                  Get.offNamed('/');
                },
                child: Text("Return Home"),
              ),
              ElevatedButton(
                onPressed: () => controller.loadRandomQuestion(),
                child: const Text("Next Question"),
              ),
            ],
          ),
        ],
      );
    });
  }
}
