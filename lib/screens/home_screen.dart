import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/widgets/layout_scaffold.dart';
import 'package:quiz_app/configs/breakpoints.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<QuestionController>();

  final welcomeMessage = "In this Quiz App, you can add, edit, and answer quiz questions, and view related statistics. Choose an option from the menu or from the buttons below to get started!";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isLarge = width > Breakpoints.md;
    return LayoutScaffold(
      title: 'Welcome to Quiz App!',
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(welcomeMessage, style: TextStyle(fontSize: 16),),
          ),
          Flex(
            direction: isLarge ? Axis.horizontal : Axis.vertical,
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: () => Get.toNamed('/edit'),
                child: Text('Add & Edit Questions'),
              ),
              FilledButton(
                onPressed: () => Get.toNamed('/questions'),
                child: Text('Answer Questions'),
              ),
              FilledButton(
                onPressed: () => Get.toNamed('/statistics'),
                child: Text('View Statistics'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}