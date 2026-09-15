import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'services/question_service.dart';
import 'services/answer_service.dart';
import 'controllers/quiz_controller.dart';
import 'controllers/question_controller.dart';
import 'controllers/answer_controller.dart';
import 'screens/home_screen.dart';
import 'screens/add_screen.dart';
import 'screens/statistics_screen.dart';
import 'screens/edit_screen.dart';
import 'screens/question_screen.dart';
import 'dart:ui';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("storage");

  // Controllers
  Get.lazyPut<QuestionController>(() => QuestionController());
  Get.lazyPut<AnswerController>(() => AnswerController());
  Get.lazyPut<QuizController>(() => QuizController());

  // Services
  Get.lazyPut<QuestionService>(() => QuestionService());
  Get.lazyPut<AnswerService>(() => AnswerService());

  runApp(
    GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/add', page: () => AddQuestionScreen()),
        GetPage(name: '/edit', page: () => EditScreen()),
        GetPage(name: '/edit/:id', page: () => EditScreen()),
        GetPage(name: '/questions', page: () => QuestionScreen()),
        GetPage(name: '/statistics', page: () => StatisticsScreen()),
      ],
    ),
  );
}
