import 'package:flutter/material.dart';
import 'package:transport_app/constants/Travel_mode.dart';
import 'package:transport_app/functionality/transportFunc/transport_app_functions.dart';
import 'package:transport_app/pages/booking_page.dart';
import 'package:transport_app/custom_widgets/app_bar.dart';
import 'package:transport_app/custom_widgets/custom_booking_button.dart';
import 'package:transport_app/custom_widgets/custom_date_picker.dart';
import 'package:transport_app/custom_widgets/custom_time_picker.dart';
import 'package:transport_app/utils/primary_service.dart';
import 'package:transport_app/utils/passenger_card.dart';

class TransportApp extends StatefulWidget {
  const TransportApp({super.key});

  @override
  _TransportAppState createState() => _TransportAppState();
}

class _TransportAppState extends State<TransportApp> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  int adults = 1;
  int infants = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedService;
  String? selectedService2; // Track the selected service mode

  void _swapValues() {
    String temp = _fromController.text;
    setState(() {
      _fromController.text = _toController.text;
      _toController.text = temp;
    });
  }

  void toggleSelection(String? selected) {
    setState(() {
      if (selectedService == selected) {
        selectedService = null; // Deselect if already selected
      } else {
        selectedService = selected; // Select if not selected
      }
    });
  }

  void toggleSelection2(String? selected) {
    setState(() {
      if (selectedService2 == selected) {
        selectedService2 = null; // Deselect if already selected
      } else {
        selectedService2 = selected; // Select if not selected
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CommonAppBar(),
              const SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _fromController,
                              decoration: const InputDecoration(
                                labelText: 'From',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.swap_vert,
                                color: Colors.purple,
                              ),
                              onPressed: _swapValues,
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _toController,
                              decoration: const InputDecoration(
                                labelText: 'To',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Primary Services',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryServices(
                            icon: Icons.directions_bus,
                            travelMode: travelModes['mode4']!,
                            isSelected: selectedService == travelModes['mode4'],
                            onTap: () => toggleSelection(travelModes['mode4']),
                          ),
                          PrimaryServices(
                            icon: Icons.train,
                            travelMode: travelModes['mode3']!,
                            isSelected: selectedService == travelModes['mode3'],
                            onTap: () => toggleSelection(travelModes['mode3']),
                          ),
                          PrimaryServices(
                            icon: Icons.directions_subway,
                            travelMode: travelModes['mode5']!,
                            isSelected: selectedService == travelModes['mode5'],
                            onTap: () => toggleSelection(travelModes['mode5']),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Secondary Services',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PrimaryServices(
                            icon: Icons.directions_car,
                            travelMode: travelModes['mode1']!,
                            isSelected:
                                selectedService2 == travelModes['mode1'],
                            onTap: () => toggleSelection2(travelModes['mode1']),
                          ),
                          PrimaryServices(
                            icon: Icons.electric_rickshaw,
                            travelMode: travelModes['mode2']!,
                            isSelected:
                                selectedService2 == travelModes['mode2'],
                            onTap: () => toggleSelection2(travelModes['mode2']),
                          ),
                          PrimaryServices(
                            icon: Icons.electric_scooter_outlined,
                            travelMode: travelModes['mode6']!,
                            isSelected:
                                selectedService2 == travelModes['mode6'],
                            onTap: () => toggleSelection2(travelModes['mode6']),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade300,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.pin_drop_rounded, color: Colors.purple),
                    const Expanded(
                      child: Text(
                        'Parking ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Parking Booked',
                            ),
                          ),
                        );
                        // Add your functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.tealAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Book Parking',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade300,
                ),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Scheduled Date & Time',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: DateSelectionWidget(
                              selectedDate: selectedDate,
                              onSelectDate: (DateTime pickedDate) {
                                setState(() {
                                  selectedDate = pickedDate;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TimeSelectionWidget(
                              selectedTime: selectedTime,
                              onSelectTime: (TimeOfDay pickedTime) {
                                setState(() {
                                  selectedTime = pickedTime;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              PassengerCard(
                onAdultsChanged: (value) {
                  setState(() {
                    adults = value;
                  });
                },
                onInfantsChanged: (value) {
                  setState(() {
                    infants = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              CustomBookingButton(
                buttonText: 'Proceed to book',
                onPressed: () => proceedToBooking(
                  selectedService,
                  selectedService2,
                  _fromController,
                  _toController,
                  selectedDate,
                  selectedTime,
                  adults,
                  infants,
                  context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
