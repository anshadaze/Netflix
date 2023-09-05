

import 'package:flutter/material.dart';

class SelectedIndexProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}