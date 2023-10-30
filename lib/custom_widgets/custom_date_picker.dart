import 'package:flutter/material.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateSelected;

  CustomDatePicker({
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "${widget.selectedDate.toLocal()}".split(' ')[0],
          style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () => _selectDate(context),
          icon: Icon(
            Icons.calendar_today,
            size: 48,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.selectedDate) {
      widget.onDateSelected(picked);
    }
  }
}
