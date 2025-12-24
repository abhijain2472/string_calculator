import 'package:string_calculator/string_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late StringCalculator calculator;
  setUp(() {
    calculator = StringCalculator();
  });

  group('StringCalculator.add()', () {
    test('should return 0 for an empty string', () {
      expect(calculator.add(""), 0);
    });
    test('should return the number itself for a single number', () {
      expect(calculator.add("1"), 1);
    });
    test('should return the sum of two numbers', () {
      expect(calculator.add("1,5"), 6);
    });
    test('should handle an unknown amount of numbers', () {
      expect(calculator.add("1,2,3"), 6);
    });
    test('should handle new lines between numbers', () {
      expect(calculator.add("1\n2,3"), 6);
    });
    test('should support single-character custom delimiters', () {
      expect(calculator.add("//;\n1;2"), 3);
    });
  });
}
