<<<<<<< HEAD
import 'package:btk_hackathon/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);
=======
import 'package:btk_hackathon/ui/homepage.dart';
import 'package:btk_hackathon/ui/uye_giris.dart';
import 'package:flutter/material.dart';

import 'item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Sample predefined schedules with different subjects and time slots
  final List<Map<String, List<Item>>> savedSchedules = [
    {
      'Mon': [Item(range: '09:00-09:59', text: 'Math'), Item(range: '10:00-10:59', text: 'Physics')],
      'Tue': [Item(range: '14:00-14:59', text: 'Chemistry')],
      'Wed': [Item(range: '11:00-11:59', text: 'Biology')],
    },
    {
      'Thu': [Item(range: '15:00-15:59', text: 'History'), Item(range: '16:00-16:59', text: 'Literature')],
      'Fri': [Item(range: '09:00-09:59', text: 'Geography')],
      'Sat': [Item(range: '13:00-13:59', text: 'Computer Science')],
    },
  ];
>>>>>>> origin/master

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const WidgetTree(),
=======
      title: 'Study Schedule App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UyeGiris(),
>>>>>>> origin/master
    );
  }
}
