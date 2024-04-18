import 'package:flutter/material.dart';

class PassengerCard extends StatefulWidget {
  final void Function(int) onAdultsChanged;
  final void Function(int) onInfantsChanged;

  const PassengerCard({
    super.key,
    required this.onAdultsChanged,
    required this.onInfantsChanged,
  });

  @override
  _PassengerCardState createState() => _PassengerCardState();
}

class _PassengerCardState extends State<PassengerCard> {
  int numberOfAdults = 1;
  int numberOfInfants = 0;

  void _increaseAdults() {
    setState(() {
      numberOfAdults++;
      widget.onAdultsChanged(numberOfAdults);
    });
  }

  void _decreaseAdults() {
    setState(() {
      if (numberOfAdults > 1) {
        numberOfAdults--;
        widget.onAdultsChanged(numberOfAdults);
      }
    });
  }

  void _increaseInfants() {
    setState(() {
      numberOfInfants++;
      widget.onInfantsChanged(numberOfInfants);
    });
  }

  void _decreaseInfants() {
    setState(() {
      if (numberOfInfants > 0) {
        numberOfInfants--;
        widget.onInfantsChanged(numberOfInfants);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Passengers',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _CountCard(
                    title: 'No of Adults',
                    count: numberOfAdults,
                    onIncrease: _increaseAdults,
                    onDecrease: _decreaseAdults,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _CountCard(
                    title: 'No of Infants',
                    count: numberOfInfants,
                    onIncrease: _increaseInfants,
                    onDecrease: _decreaseInfants,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CountCard extends StatelessWidget {
  final String title;
  final int count;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const _CountCard({
    required this.title,
    required this.count,
    required this.onIncrease,
    required this.onDecrease,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onDecrease,
                  icon: const Icon(Icons.remove),
                  splashRadius: 20,
                  iconSize: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    '$count',
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                IconButton(
                  onPressed: onIncrease,
                  icon: const Icon(Icons.add),
                  splashRadius: 20,
                  iconSize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
