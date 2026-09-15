import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/widgets/layout_scaffold.dart';
import 'package:quiz_app/widgets/question_editor.dart';

class AddQuestionScreen extends StatelessWidget {
  final controller = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    return LayoutScaffold(
      title: 'Add Question',
      body: QuestionEditor(),
    );
  }
}
