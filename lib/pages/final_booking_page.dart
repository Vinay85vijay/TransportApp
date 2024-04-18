import 'package:flutter/material.dart';
import 'package:transport_app/custom_widgets/app_bar.dart';
import 'package:transport_app/custom_widgets/custom_booking_button.dart';
import 'package:transport_app/custom_widgets/route_stops.dart';
import 'package:transport_app/custom_widgets/route_information.dart '
    as custom_route;

class FinalPage extends StatelessWidget {
  const FinalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const CommonAppBar(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      color: Colors.purple,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('BUS + Car',
                                style: TextStyle(color: Colors.white)),
                            Row(
                              children: [
                                Icon(Icons.attach_money, color: Colors.white),
                                Text('145/-',
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    custom_route.RouteInformation(routeStops: [
                      RouteStop(
                        cityName: 'Chennai Central',
                        time: '11:00 AM - 11:20 AM',
                      ),
                      RouteStop(
                        cityName: 'Adyar',
                        time: '11:20 PM - 11:40 PM',
                      ),
                      RouteStop(
                        cityName: 'Thiruvanmiyur',
                        time: '11:40PM - 12:00 PM',
                      ),
                      RouteStop(
                        cityName: 'Velichery',
                        time: '12:00 PM - 1:30 PM',
                      ),
                      // Add more RouteStop objects for additional stops
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomBookingButton(
              buttonText: 'Proceed to book',
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const BookingPage(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
