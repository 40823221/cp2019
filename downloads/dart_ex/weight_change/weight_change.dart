import "dart:html";


LBtoKG(num lb){
return lb*0.45359237;
}


KGtoLB(num kg){
return kg*2.20462262;
}


main() {
    
    InputElement tempInput = querySelector("#weight");
    querySelector("#submit").onClick.listen((e) => convert(tempInput.value));
}

convert(String data){
 
  int len;
  
  var type;
  
  var number;
  
  LabelElement output = querySelector("#output");
  
  len = data.length;
  
  type = data[len-1];
  number = data.substring(0, len-1);
  
  number = int.parse(number);
  if (type == "L" || type == "l"){
     output.innerHtml = " $number 英磅 =  ${LBtoKG(number).toStringAsFixed(2)} 公斤";
  } else if ((type == "K" || type == "k")){
     output.innerHtml = " $number 公斤 =  ${KGtoLB(number).toStringAsFixed(2)} 英磅";
  } else {
     output.innerHtml = "請輸入數字加上 L 或 K!";
  }
} 