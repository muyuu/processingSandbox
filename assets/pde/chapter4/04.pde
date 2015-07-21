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
    strokeWeight(0.5);
    smooth();

    int centerX = screenWidth / 2;
    int centerY = screenHeight / 2;


    float x, y;

    // 螺旋図を100回描く
    for (int i = 0; i < 100; ++i) {

        float lastX = -999;
        float lastY = -999;
        float radiusNoise = random(10);
        float radius = 10;

        stroke(random(20), random(50), random(70), 80);

        int startAngle = int(random(360));
        int endAngle = 1440 + int(random(1440));
        int angleStep = 5 + int(random(3));

        // 角度をループ
        for (float ang = startAngle; ang <= endAngle; ang += angleStep) {
            radiusNoise += 0.05;
            radius += 0.5;

            float thisRadius = radius + (noise(radiusNoise) * 200) - 100;

            // 角度からラジアンへ変換
            float rad = radians(ang);

            x = centerX + (thisRadius * cos(rad));
            y = centerY + (thisRadius * sin(rad));

            // point(x, y);
            if ( lastX > -999 ) {
                line(x, y, lastX, lastY);
            }
            lastX = x;
            lastY = y;
        }
    }
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
// void draw(){

// }


