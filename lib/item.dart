class Item {
  final String text;
  final String range;

  Item({required this.text, required this.range});
  // Convert Firestore data to an Item object
  factory Item.fromMap(Map<String, dynamic> data) {
    return Item(
      range: data['range'] ?? '',
      text: data['text'] ?? '',
    );
  }
  // Convert a Firestore document to a Schedule object
  factory Item.fromFirestore(Map<String, dynamic> data) {
    return Item(
      text: data['text'] ?? "",
      range: data['range'] ?? -1,
    );
  }

  // Convert a Schedule object to a Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'text': text,
      'range': range,
    };
  }
}
