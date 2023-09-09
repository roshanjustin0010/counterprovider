import 'package:flutter/material.dart';

import '../bmi_model.dart';

class BmiProvider extends ChangeNotifier {
  int _weight = 50;
  int _age = 15;
  int _height = 150;

  int get weight => _weight;
  int get age => _age;
  int get height => _height;

  void setHeight(double newVal) {
    _height = newVal.toInt();
    notifyListeners();
  }

  void addweight() {
    _weight++;
    notifyListeners();
  }

  void subweight() {
    _weight--;
    notifyListeners();
  }

  void addage() {
    _age++;
    notifyListeners();
  }

  void subage() {
    _age--;
    notifyListeners();
  }

  BmiModel getResult() {
    double bmiD = (weight / height / height) * 10000;
    print(bmiD);
    int bmi = bmiD.round();
    if (bmi >= 25) {
      return BmiModel(
        getResult: 'Overweight',
        bgColor: Colors.red,
        contentText: 'You have overweight go Exercise',
        textColor: Colors.black,
        bmiCal: bmi.toString(),
      );
    } else if (bmi >= 18) {
      return BmiModel(
        getResult: 'Normal',
        bgColor: Colors.green,
        contentText: 'You have normal body weight GOOD JOB',
        textColor: Colors.white,
        bmiCal: bmi.toString(),
      );
    } else {
      return BmiModel(
        getResult: 'Underweight',
        bgColor: Colors.yellow,
        contentText:
            'You have lower than normal body weight you can eat little more',
        textColor: Colors.black,
        bmiCal: bmi.toString(),
      );
    }
  }
}
