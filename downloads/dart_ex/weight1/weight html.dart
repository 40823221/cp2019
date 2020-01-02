// 因為要使用超文件表單, 因此導入 html 程式庫
import "dart:html";

//定義公斤(kg)轉英磅(lb)的函式
kgtolb(num k){
// 將輸入的公斤乘上2.20462,可以算出以英磅為單位的重量
return k*2.20462;
}

// 定義英磅(lb)轉公斤(kg)的函式
lbtokg(num l){
// 將輸入的華氏溫度參數減 32 之後, 乘上 5 再除以 9 之後, 可以得到攝氏溫度
return l/2.20462;
}

// 每一個 Dart 程式都從 main() 開始執行
main() {
    // 透過表單, 取得使用者輸入的溫度值, 語法為數字加上 C 或 F
    InputElement weightInput = querySelector("#weight");
    querySelector("#submit").onClick.listen((e) => convert(weightInput.value));
}

convert(String data){
  // 宣告 len 整數變數, 準備設為各字串的長度
  int len;
  // 宣告 var 變數 type, 準備設為各字串倒數第二個字元, 可能為 k 或 l
  var type;
  // 宣告 var 變數 number, 準備設為各字串中的數字
  var number;
  // 準備將轉換結果顯示在 output Label 區
  LabelElement output = querySelector("#output");
  // 直接取得單一輸入 data 字串
  len = data.length;
  // 取得各筆資料的倒數第二個字元
  type = data[len-2];
  number = data.substring(0, len-2);
  // 將字串轉為數字
  number = int.parse(number);
  if (type == "K" || type == "k"){
     output.innerHtml = " $number kg = ${kgtolb(number).toStringAsFixed(2)} lb";
  } else if ((type == "L" || type == "l")){
     output.innerHtml = " $number lb = ${lbtokg(number).toStringAsFixed(2)} kg";
  }
} 