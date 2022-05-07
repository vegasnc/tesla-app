import 'package:flutter/cupertino.dart';

class PriceTracker extends ChangeNotifier {
  int _totalAmount = 55700;

  int get totalAmount => _totalAmount;

  void setPrice(int price) {
    _totalAmount = price;
    notifyListeners();
  }
}
