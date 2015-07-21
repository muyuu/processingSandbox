// -----------------------------------------------------
// global variables
// -----------------------------------------------------
var screenWidth = document.body.offsetWidth;
var screenHeight = document.body.offsetHeight;

/*
円の描画方法は circle01.pde を参照
*/

float _angleNoise, _radiusNoise;
float _xNoise, yNoise;
float _angle = -PI / 2;
float _radius;
float _strokeColor = 254;
int _strokeChange = -1;


// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup() {

    size(screenWidth, screenHeight);
    frameRate(30);
    smooth();
    background(255);
    noFill();

    float radius = 100;
    _angleNoise = random(10);
    _radiusNoise = random(10);
    _xNoise = random(10);
    _yNoise = random(10);
}

void draw(){

    // set radius
    _radiusNoise += 0.005;
    _radius = (noise(_radiusNoise) * 550) + 1;


    // set angle
    _angleNoise += 0.005;
    _angle += (noise(_angleNoise) * 6) - 3;

    // adjust angle
    if ( _angle > 360 ) _angle -= 360;
    if ( _angle < 0 ) _angle += 360;


    // set position
    _xNoise += 0.01;
    _yNoise += 0.01;
    float centerX = screenWidth / 2 + (noise(_xNoise) * 100) - 50;
    float centerY = screenHeight / 2 + (noise(_yNoise) * 100) - 50;


    // set start point
    float rad = radians(_angle);
    float x1 = centerX + ( _radius * cos(rad) );
    float y1 = centerY + ( _radius * sin(rad) );

    // set end point
    float oppRad = rad + PI;
    float x2 = centerX + ( _radius * cos(oppRad) );
    float y2 = centerY + ( _radius * sin(oppRad) );


    // stroke
    _strokeColor += _strokeChange;
    if ( _strokeColor > 254 ) _strokeChange = -1;
    if ( _strokeColor < 0 ) _strokeChange = 1;

    stroke(_strokeColor, 60);
    strokeWeight(1);
    line(x1, y1, x2, y2);
}