import 'package:flutter/material.dart';

class BottomButtonBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  BottomButtonBar({required this.currentIndex, required this.onTabTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabTapped,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assistant),
          label: 'Assist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_fire_department),
          label: 'Calorie Tracker',
        ),
      ],
    );
  }
}
