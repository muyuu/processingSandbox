// -----------------------------------------------------
// global variables
// -----------------------------------------------------
float screenWidth = document.body.offsetWidth;
float screenHeight = document.body.offsetHeight;

float xoff = 0;
float xincrement = 0.01;
float yoff = 0;
float yincrement = 0.01;

void setup() {
    size(screenWidth, screenHeight);
    background(0);
    noStroke();
}

void draw() {

    // 前回書いたやつを少し透過させた背景色で塗れば描いたものが少し薄くなるから
    // それを繰り返すことで起動を残す描画が出来る
    fill(0, 10);
    rect(0, 0, screenWidth, screenHeight);

    // offのノイズを発生させ、screenWidthを掛ける
    // noiseの戻り値は0~1の間
    float n = noise(xoff) * screenWidth;
    float m = noise(yoff) * screenHeight;

    //offを増加
    xoff += xincrement;
    yoff += yincrement;

    // 円を描きます。
    fill(200);
    ellipse(n,m, 64, 64);
}

