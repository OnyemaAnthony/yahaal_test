

void main(){
  print(mean([2,3,4]));

}


double mean(List<int> number){
  int sum =0;
  for(int i=0; i<number.length; i++){
    sum+=number[i];
  }
  double mean = sum /number.length;
  return mean;
}