import 'package:string_calculator/string_calculator.dart';

void main(){
  final calc = StringCalculator();
  final result = calc.add('1,2,3');
  print('result: $result');
}