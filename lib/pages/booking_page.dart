import 'package:flutter/material.dart';
import 'package:transport_app/constants/Travel_mode.dart';
import 'package:transport_app/custom_widgets/booking_card_service.dart';
import 'package:transport_app/pages/final_booking_page.dart';
import 'package:transport_app/pages/trans_home_page.dart';
import 'package:transport_app/custom_widgets/app_bar.dart';
import 'package:transport_app/utils/booking_card.dart';

class BookingPage extends StatelessWidget {
  final String to;
  final String from;
  final int adults;
  final int infants;
  final DateTime selectedDateTime;
  const BookingPage({
    super.key,
    required this.adults,
    required this.infants,
    required this.selectedDateTime,
    required this.to,
    required this.from,
  });

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
              BookingCard(
                from: from,
                to: to,
                date:
                    '${selectedDateTime.day}/${selectedDateTime.month}/${selectedDateTime.year}', // Use selectedDateTime here
                time:
                    '${selectedDateTime.hour}:${selectedDateTime.minute} ${selectedDateTime.hour < 12 ? 'AM' : 'PM'}',
                journeyType: 'Single Journey',
                adults: '${adults.toString()} Adults',
                infants: '${infants.toString()} Infants',
                editCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TransportApp(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              BookingCard(
                from: travelModes['mode4']!,
                to: travelModes['mode1']!,
                price: '145/-',
                services: [
                  Service(icon: Icons.directions_bus, name: 'Bus-A/C'),
                  Service(icon: Icons.directions_bus, name: 'Bus-Ord'),
                  Service(icon: Icons.directions_car, name: 'Car-SUV'),
                ],
                bookCallback: () {
                  // Add your onPressed logic for the first button here
                },
                detailsCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinalPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              BookingCard(
                from: travelModes['mode4']!,
                to: travelModes['mode1']!,
                price: '120/-',
                services: [
                  Service(icon: Icons.directions_bus, name: 'Bus-A/C'),
                  Service(icon: Icons.train, name: travelModes['mode3']!),
                  Service(icon: Icons.directions_car, name: 'Car-SUV'),
                ],
                bookCallback: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FinalPage(),
                    ),
                  );
                },
                detailsCallback: () {
                  // Add your onPressed logic for the second button here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
