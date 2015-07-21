// -----------------------------------------------------
// global variables
// -----------------------------------------------------
var screenWidth = document.body.offsetWidth;
var screenHeight = document.body.offsetHeight;

/*
円の描画方法は circle01.pde を参照
*/


// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup() {

    size(screenWidth, screenHeight);
    background(255);
    strokeWeight(5);
    smooth();

    float radius = 10; // 小さく描く
    int centerX = screenWidth / 2;
    int centerY = screenHeight / 2;

    // 標準機能で円を描く
    stroke(0, 30);
    noFill();
    ellipse(centerX, centerY, radius  * 20, radius * 20);


    // 点を連続で記述して円を描く
    stroke(20, 50, 70);
    float x, y;
    float lastX = -999;
    float lastY = -999;

    // 角度をループ
    for (float ang = 0; ang <= 360 * 4; ang += 5) {
        radius += 0.5;

        // 角度からラジアンへ変換
        float rad = radians(ang);

        x = centerX + (radius * cos(rad));
        y = centerY + (radius * sin(rad));
        point(x, y);
    }

}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
// void draw(){

// }


