import 'dart:math';

class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi=1.0;
  String calculateBMI(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25){
      return 'Overweight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String interpretation(){
    if(_bmi>=25){
      return 'You have higher than a Normal body weight. Try to exercise more.';
    }else if(_bmi>18.5){
      return 'You have a normal body weight. Good Job !';
    }else{
      return 'You have lower than a normal body weight. You should eat more.';
    }
  }
}