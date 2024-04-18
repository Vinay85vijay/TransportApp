import 'package:flutter/material.dart';
import 'package:transport_app/custom_widgets/route_stops.dart';


class RouteInformation extends StatelessWidget {
  final List<RouteStop> routeStops;

  const RouteInformation({super.key, required this.routeStops});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: routeStops.map((stop) {
        final isLastStop = routeStops.indexOf(stop) == routeStops.length - 1;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Card(
                      child: Row(
                        children: [
                          Icon(Icons.location_on,
                              color: isLastStop ? Colors.black : Colors.purple),
                          Text(stop.cityName,
                              style: TextStyle(
                                  color: isLastStop
                                      ? Colors.black
                                      : Colors.black)),
                          Text(' (${stop.time})',
                              style: TextStyle(
                                  color: isLastStop
                                      ? Colors.black
                                      : Colors.black)),
                        ],
                      ),
                    ),
                    if (!isLastStop) // Render dot lines for all stops except the last one
                      const SizedBox(
                          height: 5), // Add space between cityName and time
                    if (!isLastStop)
                      SizedBox(
                        height: 50,
                        width: 2,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                  color: isLastStop
                                      ? Colors.transparent
                                      : Colors.purple[100]),
                            ),
                            Positioned(
                              top: 20,
                              left: 0,
                              child: Icon(Icons.circle,
                                  color: isLastStop
                                      ? Colors.transparent
                                      : Colors.purple[100],
                                  size: 10),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
