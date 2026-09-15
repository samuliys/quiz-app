import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/answer_controller.dart';
import 'package:quiz_app/configs/breakpoints.dart';
import 'package:quiz_app/widgets/layout_scaffold.dart';
import 'package:quiz_app/widgets/statistic.dart';

class StatisticsScreen extends StatelessWidget {
  final questionController = Get.find<QuestionController>();
  final answerController = Get.find<AnswerController>();

  int calculatePercentage(int correct, int total) {
    if (total == 0) return 0;
    return ((correct / total) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double aspectRatio = width < Breakpoints.sb ? 3.0 : 1.5;
    int count = width < Breakpoints.sb
        ? 1
        : width < Breakpoints.md
        ? 2
        : 3;

    return LayoutScaffold(
      title: 'Statistics',
      body: Center(
        child: GridView.count(
          crossAxisCount: count,
          padding: EdgeInsets.all(10),
          childAspectRatio: aspectRatio,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            Obx(
              () => Statistic(
                "Total questions",
                "${questionController.numQuestions}",
              ),
            ),
            Obx(
              () =>
                  Statistic("Total answers", "${answerController.numAnswers}"),
            ),
            Obx(
              () => Statistic(
                "Avg answers per question",
                "${answerController.numAnswers == 0 ? 0 : (answerController.numAnswers / questionController.numQuestions).toStringAsFixed(2)}",
              ),
            ),
            Obx(
              () => Statistic(
                "Correct answers",
                "${answerController.correctAnswers}",
              ),
            ),
            Obx(
              () => Statistic(
                "Incorrect answers",
                "${answerController.incorrectAnswers}",
              ),
            ),
            Obx(
              () => Statistic(
                "Correct answer %",
                "${calculatePercentage(answerController.correctAnswers, answerController.numAnswers)} %",
              ),
            ),
            Obx(
              () => Statistic(
                "Solved questions",
                "${questionController.numCompletedQuestions}",
              ),
            ),
            Obx(
              () => Statistic(
                "Unsolved questions",
                "${questionController.numNotCompletedQuestions}",
              ),
            ),
            Obx(
              () => Statistic(
                "Completion %",
                "${calculatePercentage(questionController.numCompletedQuestions, questionController.numQuestions)} %",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
