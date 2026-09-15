import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class EditView extends StatelessWidget {
  final controller = Get.find<QuestionController>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Obx(
            () => controller.numQuestions == 0
                ? Text('No questions added. Please add questions first.')
                : QuestionList(),
          ),
        ],
      ),
    );
  }
}

class QuestionList extends StatelessWidget {
  final controller = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: controller.questions
          .map(
            (question) => Column(
              children: [
                ListTile(
                  title: Text(question.question),
                  subtitle: Text('Options: ${question.options.join(', ')}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => Get.toNamed('/edit/${question.id}'),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          controller.deleteQuestion(question);
                        },
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          )
          .toList(),
    );
  }
}
