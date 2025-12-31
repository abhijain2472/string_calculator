class StringCalculator {
  int add(String number) {
    final delimiterPattern = _buildDelimiterPattern(number);
    final numberParts = _parseNumberParts(number);
    final parts = _parseNumbers(numberParts, delimiterPattern);
    bool isMultiplication = delimiterPattern == RegExp(RegExp.escape('*'));
    final negatives = <int>[];
    int total = isMultiplication ? 1 : 0;

    for (final value in parts) {
      if (value < 0) {
        negatives.add(value);
      } else {
        if (isMultiplication) {
          total *= value;
        } else {
          total += value;
        }
      }
    }

    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed: ${negatives.join(',')}',
      );
    }

    return total;
  }

  Pattern _buildDelimiterPattern(String number) {
    if (!number.startsWith('//')) return RegExp(',|\n');
    final newLineIndex = number.indexOf('\n');
    if (newLineIndex != -1) {
      final delimiter = number.substring(2, newLineIndex);
      return RegExp(RegExp.escape(delimiter));
    }
    return RegExp(',|\n');
  }

  String _parseNumberParts(String number) {
    if (number.startsWith('//')) {
      return number.substring(number.indexOf('\n') + 1);
    }
    return number;
  }

  List<int> _parseNumbers(String number, Pattern delimiter) {
    return number.split(delimiter).map((n) => int.tryParse(n) ?? 0).toList();
  }
}
