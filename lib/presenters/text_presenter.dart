import 'package:flutter/material.dart';

class TextPresenter extends ChangeNotifier {
  String text = 'Data';

  void changeText(String newText) {
    text = newText;
    notifyListeners();
  }
}
