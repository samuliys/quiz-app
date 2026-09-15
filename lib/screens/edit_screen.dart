import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/widgets/layout_scaffold.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/widgets/question_editor.dart';
import 'package:quiz_app/widgets/edit_view.dart';

class EditScreen extends StatelessWidget {
  final controller = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    final questionIdParam = Get.parameters['id'];
    return LayoutScaffold(
      title: 'Edit Questions',
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed('/add'),
        label: Text('Add New Question'),
        icon: Icon(Icons.add),
      ),
      body: questionIdParam == null
          ? EditView()
          : QuestionEditor(questionId: int.tryParse(questionIdParam)),
    );
  }
}
