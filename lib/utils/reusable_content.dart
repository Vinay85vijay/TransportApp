import 'package:flutter/material.dart';

class ReusableIconText extends StatelessWidget {
  final IconData icon;
  final String text;

  const ReusableIconText({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.purple,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
