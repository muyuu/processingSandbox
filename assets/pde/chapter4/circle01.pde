// -----------------------------------------------------
// global variables
// -----------------------------------------------------
var screenWidth = document.body.offsetWidth;
var screenHeight = document.body.offsetHeight;

/*
三角関数を使う練習

円を描くには中心の位置と半径があれば描ける

cos x = adj(隣辺) / hyp(斜辺)
sin x = opp(対辺) / hyp(斜辺)

中心から円周上の点を結ぶ斜辺は半径（radius）と等しい

上の式を使って対辺と隣辺を導き出す
adj = cos x * radius(hyp);
opp = sin x * radius(hyp);

実際の位置は中心点からの位置なので
x = centerX + ( cos(radian) * radius)
y = centerY + ( sin(radian) * radius)

後は角度をステップにしてループさせる
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

    // 標準機能で円を描く
    stroke(0, 30);
    noFill();
    ellipse(centerX, centerY, radius  * 2, radius * 2);


    // 点を連続で記述して円を描く
    stroke(20, 50, 70);
    float x, y;
    float lastX = -999;
    float lastY = -999;

    // 角度をループ
    for (float ang = 0; ang <= 360; ang += 5) {
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


