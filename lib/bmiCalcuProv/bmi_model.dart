import 'dart:ui';

class BmiModel {
  // Declare instance variables (properties) for your model
  String getResult;
  Color bgColor;
  String contentText;
  String bmiCal;
  Color textColor;

  // Constructor
  BmiModel(
      {required this.getResult,
      required this.bgColor,
      required this.contentText,
      required this.bmiCal,
      required this.textColor});
}
