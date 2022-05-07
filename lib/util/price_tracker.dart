import 'package:flutter/cupertino.dart';

class PriceTracker extends ChangeNotifier {
  int _totalAmount = 55700;

  int get totalAmount => _totalAmount;

  void setAmount(int amount) {
    _totalAmount = amount;
    notifyListeners();
  }

  void addAmount(int amount) {
    _totalAmount = _totalAmount + amount;
    notifyListeners();
  }

  void substractAmount(int amount) {
    _totalAmount = _totalAmount - amount;
    notifyListeners();
  }

  void resetPrice() {
    _totalAmount = 55700;
  }
}
