import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 579;
int flag_h = 305;

fivePointStar(x, y, r, solid, theta, color) {
  // 五個圓周外點數列
  List outerPoints = [];
  // 五個圓周內點數列
  List innerPoints = [];
  // 用於將角度轉為徑度的轉換子
  var degree = Math.pi / 180;
  var innerR = r * Math.cos(72 * degree) / Math.cos(36 * degree);
  // 假如在 html 模式下執行非超文件內容相關的 print, 資料將會顯示在 console 區
  print("準備畫一個位於 ($x, $y), 半徑 $r, 實心為 $solid, 顏色為 $color 的五芒星");
  // 開始設定 path
  ctx.beginPath();
  // 先設法畫一個圓心位於 x, y, 半徑為 r 的圓
  //ctx.arc(x, y, r, 0, 2 * Math.pi);
  // 沿用既有的座標系統, x 向右為正, y 向下為正
  // 利用 for 迴圈求五芒星的五個外點座標
  for (int i = 0; i <= 5; i++) {
    outerPoints.add([
      x + r * Math.sin(72 * degree * i + theta * degree),
      y - r * Math.cos(72 * degree * i + theta * degree)
    ]);
    // 內點數列, 以 innerR 為半徑, 但是角度額外轉 -36 度
    innerPoints.add([
      x +
          innerR *
              Math.sin(72 * degree * i +
                  theta * degree -
                  36 * degree),
      y -
          innerR *
              Math.cos(72 * degree * i +
                  theta * degree -
                  36 * degree)
    ]);
  }
  print(outerPoints);
  ctx.moveTo(outerPoints[0][0], outerPoints[0][1]);
  for (int i = 1; i < 5; i++) {
    ctx.lineTo(innerPoints[i][0], innerPoints[i][1]);
    ctx.lineTo(outerPoints[i][0], outerPoints[i][1]);
    ctx.lineTo(innerPoints[i + 1][0], innerPoints[i + 1][1]);
  }
  ctx.closePath();
  if (solid == false) {
    // 根據所設定的 color 值設定 strokeStyle
    ctx.strokeStyle = color;
    // path 要執行到 stroke() 方法才會下筆繪圖
    ctx.stroke();
  } else {
    ctx.fillStyle = color;
    ctx.fill();
  }
}
fivePointStar2(a, b, R, solid, theta, color) {
  // 五個圓周外點數列
  List outerPoints = [];
  // 五個圓周內點數列
  List innerPoints = [];
  // 用於將角度轉為徑度的轉換子
  var degree = Math.pi / 180;
  var innerR = R * Math.cos(72 * degree) / Math.cos(36 * degree);
  // 假如在 html 模式下執行非超文件內容相關的 print, 資料將會顯示在 console 區
  print("準備畫一個位於 ($a, $b), 半徑 $R, 實心為 $solid, 顏色為 $color 的五芒星");
  // 開始設定 path
  ctx.beginPath();
  // 先設法畫一個圓心位於 x, y, 半徑為 r 的圓
  //ctx.arc(x, y, r, 0, 2 * Math.pi);
  // 沿用既有的座標系統, x 向右為正, y 向下為正
  // 利用 for 迴圈求五芒星的五個外點座標
  for (int i = 0; i <= 5; i++) {
    outerPoints.add([
      a + R * Math.sin(72 * degree * i + theta * degree),
      b - R * Math.cos(72 * degree * i + theta * degree)
    ]);
    // 內點數列, 以 innerR 為半徑, 但是角度額外轉 -36 度
    innerPoints.add([
      a +
          innerR *
              Math.sin(72 * degree * i +
                  theta * degree -
                  36 * degree),
      b -
          innerR *
              Math.cos(72 * degree * i +
                  theta * degree -
                  36 * degree)
    ]);
  }
  print(outerPoints);
  ctx.moveTo(outerPoints[0][0], outerPoints[0][1]);
  for (int i = 1; i < 5; i++) {
    ctx.lineTo(innerPoints[i][0], innerPoints[i][1]);
    ctx.lineTo(outerPoints[i][0], outerPoints[i][1]);
    ctx.lineTo(innerPoints[i + 1][0], innerPoints[i + 1][1]);
  }
  ctx.closePath();
  if (solid == false) {
    // 根據所設定的 color 值設定 strokeStyle
    ctx.strokeStyle = color;
    // path 要執行到 stroke() 方法才會下筆繪圖
    ctx.stroke();
  } else {
    ctx.fillStyle = color;
    ctx.fill();
  }
}
void clearCanvas() {
  ctx.clearRect(0, 0, flag_w, flag_h);
}
void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  querySelector("#usa").onClick.listen((e) => drawUSA(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
}

void drawUSA(ctx) {
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(191,10,48)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  for (int i = 1; i <=11; i+=2) {
  ctx.fillRect(0, 23.4*i,flag_w / 1, 23.4);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  }
  ctx.fillStyle = 'rgb(0,40,104)';
  ctx.fillRect(0, 0, 231.53, 164.12);

  // 五芒星圓心為 (x, y)
  double x = 19.29384;
  double y = 16.39824;
  // 五芒星半徑為 r
  double r = 9.38784;
  // 若 solid 為 false, 表示畫空心五芒星, true 為著色五芒星
  bool solid = true;
  // 旋轉角度設為 0 度
  var theta = 0;
  // 因為背景為暗色, 以 white 白色作圖
  var color = "white";
  // 呼叫 fivePointStar() 函式
  int i , j ;
  for (i = 0; i < 6; i++) {
       for(j = 0; j <= 8;j++) {
         if(j%2==0)
  fivePointStar(x+i*2*x, y+j*y, r, solid, theta, color);
  }
  }
  double a =38.58;
  double b =32.82;
  double R =9.38784;
  for (i = 0; i < 5; i++) {
       for(j = 0; j <= 6;j++) {
         if(j%2==0)
  fivePointStar(a+i*2*x, b+j*y, R, solid, theta, color);
  }
  }
}