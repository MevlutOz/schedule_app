import 'package:btk_hackathon/item.dart';

class Schedule {
  final String uid;     // Unique identifier
  final name;
  final List<Item> Mon;  // Monday
  final List<Item> Tue;  // Tuesday
  final List<Item> Wed;  // Wednesday
  final List<Item> Thu;  // Thursday
  final List<Item> Fri;  // Friday
  final List<Item> Sat;  // Saturday
  final List<Item> Sun;  // Sunday

  Schedule({
    required this.uid,
    required this.name,
    required this.Mon,
    required this.Tue,
    required this.Wed,
    required this.Thu,
    required this.Fri,
    required this.Sat,
    required this.Sun,
  });

  // Convert a Firestore document to a Schedule object
  factory Schedule.fromFirestore(Map<String, dynamic> data) {
    return Schedule(
      uid: data['uid'] ?? -1,
      name: data['name'],
      Mon: data['Mon'],
      Tue: data['Tue'],
      Wed: data['Wed'],
      Thu: data['Thu'],
      Fri: data['Fri'],
      Sat: data['Sat'],
      Sun: data['Sun'],
    );
  }

  // Convert a Schedule object to a Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'name':name,
      'Mon': Mon,
      'Tue': Tue,
      'Wed': Wed,
      'Thu': Thu,
      'Fri': Fri,
      'Sat': Sat,
      'Sun': Sun,
    };
  }
}