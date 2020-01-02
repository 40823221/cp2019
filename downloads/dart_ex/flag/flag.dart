import 'dart:html';
import 'dart:math' as Math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
int flag_w = 300;
int flag_h = 200;
num circle_x = flag_w / 2;
num circle_y = flag_h / 2;

void main() {
  canvas = querySelector('#canvas');
  ctx = canvas.getContext('2d');

  drawROC(ctx);
  querySelector("#germany").onClick.listen((e) => drawGermany(ctx));
  querySelector("#netherlands").onClick.listen((e) => drawNetherlands(ctx));
  querySelector("#uk").onClick.listen((e) => drawUK(ctx));
  querySelector("#russia").onClick.listen((e) => drawRussia(ctx));
  querySelector("#france").onClick.listen((e) => drawFrance(ctx));
  querySelector("#roc").onClick.listen((e) => drawROC(ctx));
  querySelector("#jp").onClick.listen((e) => drawJP(ctx));
  querySelector("#usa").onClick.listen((e) => drawUSA(ctx));
  querySelector("#button").onClick.listen((e) => clearCanvas());
}
void drawJP(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = '#fff';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.beginPath();
  ctx.arc(circle_x, circle_y, 60, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = 'rgb(188,0,45)';
  ctx.fill();
  ctx.clearRect(300,0, 200, 300);
}
num circle_a = flag_w / 4;
num circle_b = flag_h / 4;
void drawROC(ctx){
  // 先畫滿地紅
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 0, 0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  // 再畫青天
  ctx.fillStyle = 'rgb(0, 0, 150)';
  ctx.fillRect(0, 0, flag_w / 2, flag_h / 2);
  // 畫十二道光芒白日
  ctx.beginPath();
  num star_radius = flag_w / 8;
  num angle = 0;
  for (int i = 0; i < 25; i++) {
    angle += 5 * Math.pi * 2 / 12;
    num toX = circle_a + Math.cos(angle) * star_radius;
    num toY = circle_b + Math.sin(angle) * star_radius;
    // 只有 i 為 0 時移動到 toX, toY, 其餘都進行 lineTo
    if (i != 0)
      ctx.lineTo(toX, toY);
    else
      ctx.moveTo(toX, toY);
  }
  ctx.closePath();
  // 將填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  // 白日:藍圈
  ctx.beginPath();
  ctx.arc(circle_a, circle_b, flag_w * 17 / 240, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為藍色
  ctx.fillStyle = 'rgb(0, 0, 149)';
  ctx.fill();
  // 白日:白心
  ctx.beginPath();
  ctx.arc(circle_a, circle_b, flag_w / 16, 0, Math.pi * 2, true);
  ctx.closePath();
  // 填色設為白色
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.clearRect(300,0, 200, 300);
}
void drawFrance(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(250,60,50)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0, 0,flag_w*63/100, flag_h);
  ctx.fillStyle = 'rgb(0,85,164)';
  ctx.fillRect(0, 0,flag_w*30/100, flag_h);
  ctx.clearRect(300,0, 200, 300);
  
}
void drawNetherlands(ctx) {
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(174,28,40)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0, flag_h/3, flag_w, flag_h/3);
  ctx.fillStyle = 'rgb(33, 70, 139)';
  ctx.fillRect(0, flag_h*2/3, flag_w, flag_h/3);
  ctx.clearRect(300,0, 200, 300);
}
  
void drawUK(ctx){
  ctx.clearRect(0, 0, 300, 150);
  ctx.fillStyle = 'rgb(0, 36, 125)';
  ctx.fillRect(0, 0, 300, 150);
  ctx.beginPath();
  ctx.save();
  ctx.translate(0,0);
  ctx.rotate(26*Math.pi/180);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0,-13.5, 400, 30);
  ctx.restore();
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.beginPath();
  ctx.save();
  ctx.translate(0,0);
  ctx.rotate(-26*Math.pi/180);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(-70, 118, 400, 30);
  ctx.restore();
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.beginPath();
  ctx.save();
  ctx.translate(0,0);
  ctx.rotate(26*Math.pi/180);
  ctx.fillStyle = 'rgb(207, 20, 43)';
  ctx.fillRect(-50, 0, 200, 10);
  ctx.restore();
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.beginPath();
  ctx.save();
  ctx.translate(0,0);
  ctx.rotate(26*Math.pi/180);
  ctx.fillStyle = 'rgb(207, 20, 43)';
  ctx.fillRect(190, -7, 200, 10);
  ctx.restore();
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.beginPath();
  ctx.save();
  ctx.translate(0,0);
  ctx.rotate(-26*Math.pi/180);
  ctx.fillStyle = 'rgb(207, 20, 43)';
  ctx.fillRect(-120, 132.5, 200, 10);
  ctx.restore();
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.beginPath();
  ctx.save();
  ctx.translate(0,0);
  ctx.rotate(-26*Math.pi/180);
  ctx.fillStyle = 'rgb(207, 20, 43)';
  ctx.fillRect(120,123.5, 200, 10);
  ctx.restore();
  ctx.fillStyle = '#fff';
  ctx.fill();
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(125,0, 50, 150);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  ctx.fillRect(0,50, 300, 50);
  ctx.fillStyle = 'rgb(207, 20, 43)';
  ctx.fillRect(0, 60, 300, 30);
  ctx.fillStyle = 'rgb(207, 20, 43)';
  ctx.fillRect(135, 0, 30,150 );
  ctx.clearRect(300,0, 200, 300);
  ctx.clearRect(0,150, 400, 300);
}
void drawRussia(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(225,37,29)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(0,61,165)';
  ctx.fillRect(0, 0,flag_w, flag_h*2/3);
  ctx.fillStyle = 'rgb(255,255,255)';
  ctx.fillRect(0, 0,flag_w, flag_h*1/3);
  ctx.clearRect(300,0, 200, 300);
}
void drawGermany(ctx){
  ctx.clearRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(255,204,0)';
  ctx.fillRect(0, 0, flag_w, flag_h);
  ctx.fillStyle = 'rgb(221,0,0)';
  ctx.fillRect(0, 0,flag_w, flag_h*2/3);
  ctx.fillStyle = 'rgb(0,0,0)';
  ctx.fillRect(0, 0,flag_w, flag_h*1/3);
  ctx.clearRect(300,0, 200, 300);
}
int flag_wi = 380;
int flag_he = 200;

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
void drawUSA(ctx) {
  ctx.clearRect(0, 0, flag_wi, flag_he);
  ctx.fillStyle = 'rgb(191,10,48)';
  ctx.fillRect(0, 0, flag_wi, flag_he);
  ctx.fillStyle = 'rgb(255, 255, 255)';
  for (int i = 1; i <=11; i+=2) {
  ctx.fillRect(0, 15.38*i,flag_wi, 15.38);
  }
  ctx.fillStyle = 'rgb(0,40,104)';
  ctx.fillRect(0, 0, 152,107.7);

  // 五芒星圓心為 (x, y)
  double x = 12.66;
  double y = 10.76;
  // 五芒星半徑為 r
  double r = 6.16;
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
  double a =12.66*2;
  double b =10.76*2;
  double R =6.16;
  for (i = 0; i < 5; i++) {
       for(j = 0; j <= 6;j++) {
         if(j%2==0)
  fivePointStar(a+i*2*x, b+j*y, R, solid, theta, color);
  }
  }
}
void clearCanvas(){
  ctx.clearRect(0, 0, flag_wi, flag_he);
}