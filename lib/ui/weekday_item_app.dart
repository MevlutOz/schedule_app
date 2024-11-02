import 'package:btk_hackathon/item.dart';
import 'package:flutter/material.dart';
import 'item_dialog.dart';


class WeekdayItemApp extends StatefulWidget {
  @override
  _WeekdayItemAppState createState() => _WeekdayItemAppState();
}

class _WeekdayItemAppState extends State<WeekdayItemApp> {
  final Map<String, List<Item>> dayItems = {
    'Mon': [],
    'Tue': [],
    'Wed': [],
    'Thu': [],
    'Fri': [],
    'Sat': [],
    'Sun': [],
  };

  final Map<String, List<String>> availableHours = {
    'Mon': List.generate(24, (i) {
      final startHour = i.toString().padLeft(2, '0');
      return '$startHour:00-$startHour:59';
    }),
    'Tue': List.generate(24, (i) {
      final startHour = i.toString().padLeft(2, '0');
      return '$startHour:00-$startHour:59';
    }),
    'Wed': List.generate(24, (i) {
      final startHour = i.toString().padLeft(2, '0');
      return '$startHour:00-$startHour:59';
    }),
    'Thu': List.generate(24, (i) {
      final startHour = i.toString().padLeft(2, '0');
      return '$startHour:00-$startHour:59';
    }),
    'Fri': List.generate(24, (i) {
      final startHour = i.toString().padLeft(2, '0');
      return '$startHour:00-$startHour:59';
    }),
    'Sat': List.generate(24, (i) {
      final startHour = i.toString().padLeft(2, '0');
      return '$startHour:00-$startHour:59';
    }),
    'Sun': List.generate(24, (i) {
      final startHour = i.toString().padLeft(2, '0');
      return '$startHour:00-$startHour:59';
    }),
  };

  String selectedDay = 'Mon';

  void _addItem() async {
    final result = await showDialog<Item>(
      context: context,
      builder: (context) => ItemDialog(availableHours[selectedDay]!, dayItems[selectedDay]!),
    );

    if (result != null) {
      setState(() {
        dayItems[selectedDay]?.add(result);
        // Remove the selected hour from available hours for the day
        availableHours[selectedDay]?.remove(result.range);
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      // Add the hour back to the available hours when an item is removed
      String removedHour = dayItems[selectedDay]![index].range;
      dayItems[selectedDay]?.removeAt(index);
      // Insert the removed hour back to its sorted place
      availableHours[selectedDay]?.add(removedHour);
      availableHours[selectedDay]?.sort(); // Keep the list sorted
    });
  }

  void _selectDay(String day) {
    setState(() {
      selectedDay = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weekday Item App')),
      body: Column(
        children: [
          // Scrollable Row for Weekday Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                  .map((day) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  onPressed: () => _selectDay(day),
                  child: Text(day),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      day == selectedDay ? Colors.blue : Colors.grey,
                    ),
                  ),
                ),
              ))
                  .toList(),
            ),
          ),
          // Plus Button and Item List
          Expanded(
            child: Column(
              children: [
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addItem,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: dayItems[selectedDay]?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = dayItems[selectedDay]![index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align items
                          children: [
                            Text(
                              item.text,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              item.range,
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeItem(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
