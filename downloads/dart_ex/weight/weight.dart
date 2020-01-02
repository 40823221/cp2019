LBtoKG(num lb){

return lb*0.45359237;
}


KGtoLB(num kg){

return kg*2.20462262;
}


main() {
 
  int len;
 
  var type;
  
  var number;
  List weight = ["25K", "30L", "56L", "14K", "68L", "198K"];
  for (var data in weight) {
    
    len = data.length;
    
    type = data[len-1];
   
    number = data.substring(0, len-1);
   
    number = int.parse(number);
   
    if (type == "L"){
     
      print("$number 英磅 =  ${LBtoKG(number).toStringAsFixed(4)} 公斤");
    }else{
     
      print("$number 公斤 =  ${KGtoLB(number).toStringAsFixed(4)} 英磅");
    }
      
  } 
} 