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

    var xstep = 10;
    var ystep = 10;
    var lastX = 10;
    var lastY = screenHeight / 2;
    var y = screenHeight / 2;

    for (int x = 20; x < screenWidth - 20; x += xstep ) {
        ystep = random(20) - 10;
        y += ystep;
        line(x, y, lastX, lastY);
        lastX = x;
        lastY = y;
    }
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
// void draw(){
// }


