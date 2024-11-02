import 'package:btk_hackathon/item.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';

class StudyScheduleList extends StatelessWidget {
  final Map<String, List<Item>> dayItems;
  final List<Map<String, List<Item>>> savedSchedules;

  StudyScheduleList({required this.dayItems, required this.savedSchedules});

  void _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Save Schedule'),
          content: Text('Do you want to save this schedule?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Cancel
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                savedSchedules.add(Map.from(dayItems)); // Save schedule
                Navigator.pop(context); // Close dialog
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage(savedSchedules: savedSchedules)),
                );
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Study Schedule List')),
      body: ListView(
        children: dayItems.entries.map((entry) {
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => _showSaveDialog(context),
          child: Text('Save Schedule'),
        ),
      ),
    );
  }
}
