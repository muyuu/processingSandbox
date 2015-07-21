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

    float radius = 100;
    int centerX = screenWidth / 2;
    int centerY = screenHeight / 2;

    stroke(0, 30);
    noFill();
    ellipse(centerX, centerY, radius * 2, radius * 2);


    stroke(20, 50, 70);
    strokeWeight(1);

    float x, y;
    float noiseVal = random(10);
    float radVarience, thisRadius, rad;

    // シェイプを開始する
    beginShape();
    fill(20, 50, 70, 50);

    for (float ang = 0; ang <= 360; ang += 1) {
        noiseVal += 0.1;
        radVarience = 30 * customNoise(noiseVal);

        thisRadius = radius + radVarience;
        // thisRadius = radius;
        rad = radians(ang);
        x = centerX + (thisRadius * cos(rad));
        y = centerY + (thisRadius * sin(rad));

        // シェイプの点を追加
        curveVertex(x, y);
    }
    // シェイプ終了
    endShape();
}

/**
 * -1 から 1 のカスタムノイズ
 * @param  {[type]} float value         [description]
 * @return {[type]}       [description]
 */
 float customNoise (float value){
    float result = pow(sin(value), 3);
    return result;
}