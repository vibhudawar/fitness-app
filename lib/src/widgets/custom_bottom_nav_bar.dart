import 'package:fitness_app/src/view/home_screen_view_model.dart';
import 'package:flutter/material.dart';

Widget CustomBottomNavBar(HomeScreenViewModel model) {
  return BottomNavigationBar(
    currentIndex: model.selectedIndex,
    selectedItemColor: Colors.black,
    onTap: model.onItemTapped,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home),
        backgroundColor: Colors.lightGreen,
      ),
      BottomNavigationBarItem(
        label: 'History',
        icon: Icon(Icons.history),
        backgroundColor: Colors.lightGreen,
      ),
      BottomNavigationBarItem(
        label: 'Account',
        icon: Icon(Icons.person_rounded),
        backgroundColor: Colors.lightGreen,
      ),
    ],
  );
}
