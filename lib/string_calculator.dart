class StringCalculator {
  int add(String number) {
    String numbersPart = number;
    Pattern delimiterPattern = RegExp(',|\n');
    if (number.isEmpty) return 0;
    if (numbersPart.startsWith('//')) {
      final newLineIndex = number.indexOf('\n');
      if (newLineIndex != -1) {
        final delimiter = number.substring(2, newLineIndex);
        delimiterPattern = RegExp(RegExp.escape(delimiter));
        numbersPart = number.substring(newLineIndex + 1);
      }
    }
    final parts = numbersPart.split(delimiterPattern);
    final negatives = <int>[];
    int sum = 0;

    for (final part in parts) {
      final value = int.tryParse(part) ?? 0;
      if (value < 0) {
        negatives.add(value);
      } else {
        sum += value;
      }
    }

    if (negatives.isNotEmpty) {
      throw Exception(
        'negative numbers not allowed: ${negatives.join(',')}',
      );
    }

    return sum;
  }
}
