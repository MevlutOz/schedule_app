import 'package:btk_hackathon/auth.dart';
import 'package:btk_hackathon/item.dart';
import 'package:btk_hackathon/models/schedule_model.dart';
import 'package:btk_hackathon/ui/study_schedule_list.dart';
import 'package:btk_hackathon/widget_tree.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:btk_hackathon/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'item.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print("Anan");
  Homepage.readySavedSchedules = await getSchedules();
  print("Anan Later");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WidgetTree(),
      title: 'Study Schedule App',
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
getSchedules() async {
  User? user = await Auth().current_user;
  FirebaseFirestore firestore = await FirebaseFirestore.instance;
  final List<Map<String, List<Item>>> readySavedSchedules = [];
  firestore
      .collection('Schedules')
      .where('uid', isEqualTo: user?.uid)
      .get()
      .then((value) {
    var documents = value.docs;
    for (var document in documents) {
      var schedule = Schedule.fromFirestore(document.data());

      readySavedSchedules.add({
        'Mon': schedule.Mon,
        'Tue': schedule.Tue,
      });

    }
    return readySavedSchedules;
  });

}