import 'package:flutter/material.dart';
import 'package:transport_app/pages/booking_page.dart';

void proceedToBooking(
  String? selectedService,
  String? selectedService2,
  TextEditingController fromController,
  TextEditingController toController,
  DateTime? selectedDate,
  TimeOfDay? selectedTime,
  int adults,
  int infants,
  BuildContext context,
) {
  if (fromController.text.isEmpty || toController.text.isEmpty) {
    // Show error message if "From" or "To" is empty
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Please enter both From and To locations',
        ),
      ),
    );
  } else if (selectedService == null && selectedService2 == null) {
    // Show error message if no service mode is selected
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Please select at least one service mode',
        ),
      ),
    );
  } else if (selectedDate == null || selectedTime == null) {
    // Show error message if date or time is not selected
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Please select date and time',
        ),
      ),
    );
  } else {
    // Proceed to the next page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingPage(
          from: fromController.text,
          to: toController.text,
          adults: adults,
          infants: infants,
          selectedDateTime: DateTime(
            selectedDate.year,
            selectedDate.month,
            selectedDate.day,
            selectedTime.hour,
            selectedTime.minute,
          ),
        ),
      ),
    );
  }
}
