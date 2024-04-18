import 'package:flutter/material.dart';
import 'package:transport_app/custom_widgets/booking_card_service.dart';
import 'package:transport_app/utils/primary_service.dart';
import 'package:transport_app/utils/reusable_content.dart';

class BookingCard extends StatelessWidget {
  const BookingCard({
    super.key,
    required this.from,
    required this.to,
    this.date,
    this.time,
    this.journeyType,
    this.adults,
    this.infants,
    this.price,
    this.services,
    this.editCallback,
    this.bookCallback,
    this.detailsCallback,
  });

  final String from;
  final String to;
  final String? date;
  final String? time;
  final String? journeyType;
  final String? adults;
  final String? infants;
  final String? price;
  final List<Service>? services;
  final VoidCallback? editCallback;
  final VoidCallback? bookCallback;
  final VoidCallback? detailsCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(from,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const Icon(Icons.arrow_forward, size: 20),
                      Text(to,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      if (editCallback != null)
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .end, // Aligns edit icon to the right
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade300,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    onPressed: editCallback,
                                    icon: const Icon(Icons.edit,
                                        color: Colors.purple),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                if (price != null)
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.currency_rupee),
                        Text(price!,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            if (date != null && time != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReusableIconText(icon: Icons.calendar_month, text: date!),
                  const SizedBox(width: 10),
                  ReusableIconText(icon: Icons.timer, text: time!),
                ],
              ),
            const SizedBox(height: 10),
            if (journeyType != null && adults != null && infants != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ReusableIconText(icon: Icons.route, text: journeyType!),
                  const SizedBox(width: 26),
                  ReusableIconText(icon: Icons.person, text: adults!),
                  const SizedBox(width: 10),
                  ReusableIconText(icon: Icons.shopping_cart, text: infants!),
                ],
              ),
            if (services != null)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < services!.length; i++) ...[
                      PrimaryServices(
                        icon: services![i].icon,
                        travelMode: services![i].name,
                        isSelected: false,
                        onTap: () {},
                      ),
                      if (i !=
                          services!.length -
                              1) // Add the arrow icon if it's not the last service
                        const Icon(Icons.arrow_forward),
                    ],
                  ],
                ),
              ),
            if (bookCallback != null || detailsCallback != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (bookCallback != null)
                    ElevatedButton(
                      onPressed: bookCallback,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 41, 176, 39),
                      ),
                      child: const Text('Book'),
                    ),
                  const SizedBox(width: 10),
                  if (detailsCallback != null)
                    ElevatedButton(
                      onPressed: detailsCallback,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: const Text('Details'),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
