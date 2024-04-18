import 'package:flutter/material.dart';

class TimeSelectionWidget extends StatelessWidget {
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onSelectTime;

  const TimeSelectionWidget({
    super.key,
    required this.selectedTime,
    required this.onSelectTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: selectedTime ?? TimeOfDay.now(),
        );
        if (pickedTime != null && pickedTime != selectedTime) {
          onSelectTime(pickedTime);
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
            text: selectedTime != null
                ? '${selectedTime!.hourOfPeriod}:${selectedTime!.minute} ${selectedTime!.period == DayPeriod.am ? 'AM' : 'PM'}'
                : '',
          ),
          enabled: false,
          decoration: const InputDecoration(
            hintText: 'Select Time',
            border: InputBorder.none,
            suffixIcon: Icon(Icons.timer),
          ),
        ),
      ),
    );
  }
}
