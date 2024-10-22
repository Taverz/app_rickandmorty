import 'package:flutter_test/flutter_test.dart';
//TODO: fake test from CI
void main() {
  group('Calculator', () {
    test('should return the sum of two numbers', () {
      final calculator = Calculator();

      expect(calculator.add(2, 3), 5);
      expect(calculator.add(-1, 1), 0);
      expect(calculator.add(0, 0), 0);
    });
  });
}

class Calculator {
  int add(int a, int b) {
    return a + b;
  }
}
