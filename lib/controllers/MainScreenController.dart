import 'package:flutter/material.dart';

class MainScreenController extends ChangeNotifier {
  int selectedTabIndex = 0;

  void changeTabIndex(int index) {
    this.selectedTabIndex = index;
    notifyListeners();
  }
}