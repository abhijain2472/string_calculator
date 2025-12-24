class StringCalculator{
  int add(String number){
    if(number.isEmpty) return 0;
    return number.split(',').map(int.parse).fold(0, (sum,current)=>sum+current);
  }
}