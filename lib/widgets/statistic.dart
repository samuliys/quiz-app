import 'package:flutter/material.dart';

class Statistic extends StatelessWidget {
  final String label;
  final String value;

  Statistic(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: ListTile(
          title: Text(value, textAlign: TextAlign.center),
          subtitle: Text(label.toUpperCase(), textAlign: TextAlign.center),
          titleAlignment: ListTileTitleAlignment.center,
          titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
