import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:btk_hackathon/item.dart';
import 'package:btk_hackathon/models/schedule_model.dart';

import '../auth.dart';

final firestore = FirebaseFirestore.instance;

class Homepage extends StatelessWidget {
  final List<Map<String, List<Item>>> savedSchedules;
  User? user = Auth().current_user;



  static late List<Map<String, List<Item>>> readySavedSchedules;

  Homepage({required this.savedSchedules});

  @override
  Widget build(BuildContext context) {
    // Combine both user-saved schedules and pre-defined schedules
    final combinedSchedules = [...readySavedSchedules, ...savedSchedules];

    return Scaffold(
      appBar: AppBar(title: Text('Saved Schedules')),
      body: ListView.builder(
        itemCount: combinedSchedules.length,
        itemBuilder: (context, index) {
          final schedule = combinedSchedules[index];
          final isReadySaved = index < readySavedSchedules.length;

          return Card(
            margin: EdgeInsets.all(8),
            child: ExpansionTile(
              title: Text(isReadySaved
                  ? 'Predefined Schedule ${index + 1}'
                  : 'Custom Schedule ${index + 1 - readySavedSchedules.length}'),
              children: schedule.entries.map((entry) {
                final day = entry.key;
                final items = entry.value;
                return ExpansionTile(
                  title: Text(day),
                  children: items.map((item) {
                    return ListTile(
                      title: Text(item.range),
                      subtitle: Text(item.text),
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}

createSchedule(Schedule schedule) async {
  await firestore.collection('Schedules').add(schedule.toFirestore());
}


