import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/models/question.dart';

class QuestionEditor extends StatelessWidget {
  final int? questionId;
  final controller = Get.find<QuestionController>();
  final _formKey = GlobalKey<FormBuilderState>();

  _submit() {
    if (_formKey.currentState!.saveAndValidate()) {
      final data = _formKey.currentState!.value;
      final String question = data['question'];
      final options = [
        data['option_0'],
        data['option_1'],
        data['option_2'],
      ].cast<String>();
      final int correctOption = data['correct_option'];
      if (questionId != null) {
        controller.editQuestion(
          Question(questionId!, question, options, correctOption, false),
        );
      } else {
        controller.addQuestion(question, options, correctOption);
      }
      _formKey.currentState?.reset();
      Get.back();
    }
  }

  QuestionEditor({this.questionId});

  @override
  Widget build(BuildContext context) {
    Question? existingQuestion;
    if (questionId != null) {
      existingQuestion = controller.getQuestionById(questionId!);
    }

    final initialValues = existingQuestion == null
        ? <String, dynamic>{}
        : {
            'question': existingQuestion.question,
            'option_0': existingQuestion.options[0],
            'option_1': existingQuestion.options[1],
            'option_2': existingQuestion.options[2],
            'correct_option': existingQuestion.correctOption,
          };
    return Container(
      padding: EdgeInsets.all(20),
      child: FormBuilder(
        key: _formKey,
        initialValue: initialValues,
        child: Column(
          spacing: 10,
          children: [
            FormBuilderTextField(
              name: "question",
              decoration: InputDecoration(
                labelText: "Question",
                border: OutlineInputBorder(),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: FormBuilderValidators.required(),
            ),
            Text("Answer options:"),
            Column(
              spacing: 16,
              children: Iterable<int>.generate(3)
                  .map(
                    (i) => FormBuilderTextField(
                      name: "option_$i",
                      decoration: InputDecoration(
                        labelText: "Option ${i + 1}",
                        border: OutlineInputBorder(),
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: FormBuilderValidators.required(),
                    ),
                  )
                  .toList(),
            ),
            FormBuilderRadioGroup(
              name: "correct_option",
              decoration: InputDecoration(labelText: "Correct Option"),
              options: Iterable<int>.generate(3)
                  .map(
                    (i) => FormBuilderFieldOption(
                      value: i,
                      child: Text("Option ${i + 1}"),
                    ),
                  )
                  .toList(),
              validator: FormBuilderValidators.required(),
            ),
            FilledButton(
              onPressed: _submit,
              child: Text(questionId != null ? "Save Changes" : "Add Question"),
            ),
            ElevatedButton(
              onPressed: () => Get.offNamed('/'),
              child: Text("Return Home"),
            ),
          ],
        ),
      ),
    );
  }
}
