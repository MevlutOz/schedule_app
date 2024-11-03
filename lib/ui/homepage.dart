import 'package:btk_hackathon/item.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final List<Map<String, List<Item>>> savedSchedules;
  final List<Map<String, List<Item>>> readySavedSchedules = [
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
