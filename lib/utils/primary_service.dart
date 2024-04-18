import 'package:flutter/material.dart';

class PrimaryServices extends StatelessWidget {
  final String travelMode;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const PrimaryServices({
    super.key,
    required this.travelMode,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    String? selectedService,
  });

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? 6 : 0,
        child: Container(
          width: 100,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? Colors.purple : Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: isSelected ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 8),
              Text(
                travelMode,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
