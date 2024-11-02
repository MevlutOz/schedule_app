import 'package:flutter/material.dart';
import 'weekday_item_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeekdayItemApp(),
    );
  }
}
