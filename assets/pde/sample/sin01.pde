// -----------------------------------------------------
// global variables
// -----------------------------------------------------
float screenWidth = document.body.offsetWidth;
float screenHeight = document.body.offsetHeight;



// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup(){
    size(screenWidth, screenHeight);
    background(255);
    strokeWeight(5);
    smooth();

    stroke(20, 50, 70);

    var center = screenHeight / 2;
    var step = 1;
    var lastX = -999;
    var lastY = -999;
    var angle = 0;
    var y = center;

    for (int x = 20; x < screenWidth - 20; x += step ) {
        var rad = radians(angle);

        // y = center + (sin(rad) * 40);  // 滑らかなサインカーブになる
        // y = center + ( pow(sin(rad), 3) * 40);
        y = center + ( pow(sin(rad), 3) * noise(rad * 2) * 40);

        if ( lastX > -999) {
            line(x, y, lastX, lastY);
        }
        lastX = x;
        lastY = y;
        angle++;
    }
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
// void draw(){
// }


