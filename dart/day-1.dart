var lines = ('''199
200
208
210
200
207
240
269
260
263''').split("\n");
const INCREASE = "(increased)";
const DECREASE = "(decreased)";
void main() {
  var last;
  var increases = 0;
  for(var line in lines){
    var val = int.parse(line);
    if(last == null){
      print(line + " (N/A - no previous measurement)");
      last = val;
    }else{
      if(val >= last){
        print(line + " " + INCREASE);
        increases++;
      }else{
        print(line + " " + DECREASE);
      }
      last = val;
    }
  }
  print(increases.toString() + " measurements are larger than the previous measurement");
}
