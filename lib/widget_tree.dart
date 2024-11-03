import 'package:btk_hackathon/auth.dart';
import 'package:btk_hackathon/pages/login_register_page.dart';
import 'package:btk_hackathon/ui/weekday_item_app.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges, builder: (context, snapshot) {
      if (snapshot.hasData) {
        return WeekdayItemApp();
      }
      else {
        return const LoginPage();
      }
    });
  }
}