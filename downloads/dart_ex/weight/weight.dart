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

// 每一個 Dart 程式都必須從 main() 開始執行
main() {
  // 宣告 len 整數變數, 準備設為各字串的長度
  int len;
  // 宣告 var 變數 type, 準備設為各字串最後一個字元, 可能為 K 或 L
  var type;
  // 宣告 var 變數 number, 準備設為各字串中的數字
  var number;
  List weight = ["25kg", "30lb", "56lb", "14kg", "68lb", "198kg"];
  // 利用重複迴圈, 逐一讀出各筆資料
  for (var data in weight) {
    //print(i);
    //print(i[2]);
    len = data.length;
    // 取得各筆資料的倒數第二個字元
    //print(data[len-2]);
  type = data[len-2];
    // https://api.dartlang.org/stable/2.6.1/dart-core/Object/runtimeType.html
    // 希望取得 Dart 程式中特定物件的資料型別, 可以透過該物件的 runtimeType 屬性取得
    //print("目前 type 變數資料型別為: ${type.runtimeType}");
    // 根據重量單位類別轉給對應函式進行重量單位轉換
    // https://api.dartlang.org/stable/2.6.1/dart-core/String/substring.html
    number = data.substring(0, len-2);
    // https://api.dartlang.org/stable/2.6.1/dart-core/Object/runtimeType.html
    //print("目前 number 變數資料型別為: ${number.runtimeType}");
    // 由於取得的 number 為字串, 必須設法轉為數字
   // https://stackoverflow.com/questions/13167496/how-do-i-parse-a-string-into-a-number-with-dart
    number = int.parse(number);
    // https://api.dartlang.org/stable/2.6.1/dart-core/Object/runtimeType.html
    //print("目前 number 變數資料型別為: ${number.runtimeType}");
    // 之後就可以根據 type 與 number 執行各數列元素的重量單位轉換
    
    if (type == "K"|| type == "k"){
      print("$number kg = ${kgtolb(number).toStringAsFixed(2)} lb");
    }
    else{
      print("$number lb = ${lbtokg(number).toStringAsFixed(2)} kg");
    }
      
  } 
}