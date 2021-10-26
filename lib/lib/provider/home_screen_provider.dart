import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  int _currentBottomBarIndex = 0;

  int get currentBottomIndex => _currentBottomBarIndex;

  set currentBottomIndex(int index) {
    if (_currentBottomBarIndex != index) {
      _currentBottomBarIndex = index;
      notifyListeners();
    }
  }
}