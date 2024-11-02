import 'package:flutter/material.dart';
import 'models/item.dart';

class ItemDialog extends StatefulWidget {
  final List<String> availableHours;
  final List<Item> dayItems;

  ItemDialog(this.availableHours, this.dayItems);

  @override
  _ItemDialogState createState() => _ItemDialogState();
}

class _ItemDialogState extends State<ItemDialog> {
  final TextEditingController _textController = TextEditingController();
  String _selectedRange = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Item'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textController,
            decoration: InputDecoration(labelText: 'Item Name'),
          ),
          DropdownButton<String>(
            value: _selectedRange.isEmpty ? null : _selectedRange,
            hint: Text('Select Hour Range'),
            items: widget.availableHours.map((range) {
              return DropdownMenuItem(
                value: range,
                child: Text(range),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedRange = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_textController.text.isNotEmpty && _selectedRange.isNotEmpty) {
              Navigator.of(context).pop(Item(
                text: _textController.text,
                range: _selectedRange,
              ));
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
