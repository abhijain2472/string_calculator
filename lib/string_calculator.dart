class StringCalculator{
  int add(String number){
    if(number.isEmpty) return 0;
    final delimiterRegex = RegExp(',|\n');
    final parts = number.split(delimiterRegex);
    return parts.map(int.parse).fold(0, (sum,current)=>sum+current);
  }
}