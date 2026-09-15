import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/configs/breakpoints.dart';
import 'package:quiz_app/configs/navigation.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';

class LayoutScaffold extends StatelessWidget {
  final Widget body;
  final String title;
  final Widget? floatingActionButton;

  LayoutScaffold({
    required this.body,
    required this.title,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isSmall = width < Breakpoints.sb;
    bool isLarge = width > Breakpoints.md;

    final controller = Get.find<QuizController>();
    final navConfig = NavConfig();

    if (isSmall) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        floatingActionButton: floatingActionButton,
        body: Column(
          spacing: 20,
          children: [
            Text(title, style: TextStyle(fontSize: 24)),
            Expanded(child: body),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navConfig.getSelectedIndex(),
          items: navConfig.getBottomItems(),
          onTap: (index) {
            Get.toNamed("/${navConfig.routes[index]}");
          },
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: SizedBox(
            width: Breakpoints.lg,
            child: Row(
              children: [
                NavigationRail(
                  selectedIndex: navConfig.getSelectedIndex(),
                  destinations: navConfig.getRailDestinations(),
                  onDestinationSelected: (index) {
                    controller.exitQuiz();
                    Get.toNamed("/${navConfig.routes[index]}");
                  },
                  extended: isLarge,
                  labelType: isLarge
                      ? NavigationRailLabelType.none
                      : NavigationRailLabelType.all,
                ),
                Expanded(
                  child: Column(
                    spacing: 20,
                    children: [
                      Text(title, style: TextStyle(fontSize: 24)),
                      if (floatingActionButton != null)
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: floatingActionButton!,
                          ),
                        ),
                      Expanded(child: body),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
