class StringCalculator{
  int add(String number){
    String numbersPart = number;
    Pattern delimiterPattern = RegExp(',|\n');
    if(number.isEmpty) return 0;
    if (numbersPart.startsWith('//')) {
      final newLineIndex = number.indexOf('\n');
      final delimiter = number.substring(2, newLineIndex);
      delimiterPattern = RegExp(RegExp.escape(delimiter));
      numbersPart = number.substring(newLineIndex + 1);
    }
    final parts = numbersPart.split(delimiterPattern);
    return parts.map(int.parse).fold(0, (sum,current)=>sum+current);
  }
}