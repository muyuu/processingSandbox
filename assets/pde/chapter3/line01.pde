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

    var step = 10;
    var lastX = -999;
    var lastY = -999;
    var y = screenHeight / 2;
    var borderX = 20;
    var borderY = 10;

    for (int x = borderX; x < screenWidth - borderX; x += step ) {
        y = borderY + random( screenHeight - 2 * borderY );

        if ( lastX > -999) {
            line(x, y, lastX, lastY);
        }
        lastX = x;
        lastY = y;
    }
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
// void draw(){
// }


