import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavConfig {
  final List<String> routes = ['', 'questions', 'edit', 'statistics'];

  final List<NavItem> items = [
    NavItem(icon: Icons.home, label: 'Home'),
    NavItem(icon: Icons.quiz, label: 'Quiz'),
    NavItem(icon: Icons.edit, label: 'Edit'),
    NavItem(icon: Icons.bar_chart, label: 'Statistics'),
  ];

  int getSelectedIndex() {
    String current = Get.currentRoute.replaceAll("add", "edit").split('/')[1];
    return routes.indexOf(current);
  }

  List<BottomNavigationBarItem> getBottomItems() {
    return items
        .map((i) => BottomNavigationBarItem(icon: Icon(i.icon), label: i.label))
        .toList();
  }

  List<NavigationRailDestination> getRailDestinations() {
    return items
        .map(
          (i) => NavigationRailDestination(
            icon: Icon(i.icon),
            label: Text(i.label),
          ),
        )
        .toList();
  }
}

class NavItem {
  final IconData icon;
  final String label;

  NavItem({required this.icon, required this.label});
}
