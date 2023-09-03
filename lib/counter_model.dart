import 'package:flutter/cupertino.dart';

class CounterModel extends ChangeNotifier{
  int _counter = 0;
  int get count=>_counter;

  void incrementCounter() {
      _counter++;
      notifyListeners();
  }
}