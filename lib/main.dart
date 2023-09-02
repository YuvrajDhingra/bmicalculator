import 'package:flutter/material.dart';
import 'inputpage.dart';
void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF150c25),
        scaffoldBackgroundColor: Color(0xFF150c25),
      ),
      home: InputPage(),
    );
  }
}