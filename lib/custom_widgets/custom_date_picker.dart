import 'package:flutter/material.dart';

class DateSelectionWidget extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime) onSelectDate;

  const DateSelectionWidget({
    super.key,
    required this.selectedDate,
    required this.onSelectDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(DateTime.now().year + 1),
        );
        if (pickedDate != null && pickedDate != selectedDate) {
          onSelectDate(pickedDate);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          controller: TextEditingController(
            text: selectedDate != null
                ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                : '',
          ),
          enabled: false,
          decoration: InputDecoration(
            hintText: 'DD/MM/YYYY',
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.edit_calendar_rounded),
              onPressed: () {
                // Open date picker
              },
            ),
          ),
        ),
      ),
    );
  }
}
