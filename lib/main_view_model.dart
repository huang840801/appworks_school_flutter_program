import 'package:flutter/cupertino.dart';

class MainViewModel extends ChangeNotifier {
  int selectedColorIndex = -1;
  int selectedSizeIndex = -1;

  void onColorSelected(int index) {
    selectedColorIndex = index;
    selectedSizeIndex = -1;
    notifyListeners();
  }

  void onSizeSelected(int index) {
    selectedSizeIndex = index;
    notifyListeners();
  }
}
