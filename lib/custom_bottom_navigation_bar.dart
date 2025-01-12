import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onItemTapped,
    this.selectedIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      color: const Color(0xFFF0F9FF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              color: selectedIndex == 0 ? Colors.blue : Colors.grey,
              onPressed: () => onItemTapped(0),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              color: selectedIndex == 1 ? Colors.blue : Colors.grey,
              onPressed: () => onItemTapped(1),
            ),
            const SizedBox(width: 40), // Space for FAB
            IconButton(
              icon: const Icon(Icons.description),
              color: selectedIndex == 2 ? Colors.blue : Colors.grey,
              onPressed: () => onItemTapped(2),
            ),
            IconButton(
              icon: const Icon(Icons.group),
              color: selectedIndex == 3 ? Colors.blue : Colors.grey,
              onPressed: () => onItemTapped(3),
            ),
          ],
        ),
      ),
    );
  }
}
