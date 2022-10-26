import 'package:flutter/material.dart';
import 'package:migoc2/pages/base/navigation/controllers/page_controller.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void bottomTapped(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }
}
