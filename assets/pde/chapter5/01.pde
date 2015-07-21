// -----------------------------------------------------
// global variables
// -----------------------------------------------------
var screenWidth = document.body.offsetWidth;
var screenHeight = document.body.offsetHeight;

/*
2次元のノイズを作る
*/


// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup() {

    size(screenWidth, screenHeight);
    background(255);
    smooth();

    float startX = random(10);
    float xNoise = startX;
    float yNoise = random(10);

    for (int y = 0; y <= screenHeight; y += 1) {
        yNoise += 0.01;
        xNoise = startX; // reset

        for ( int x = 0; x <= screenWidth; x += 1) {
            xNoise += 0.01;

            int alph = int(noise(xNoise, yNoise) * 255);
            stroke(0, alph);
            line(x, y, x+1, y+1);
        }
    }
}


