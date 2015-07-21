// -----------------------------------------------------
// global variables
// -----------------------------------------------------
float screenWidth = document.body.offsetWidth;
float screenHeight = document.body.offsetHeight;

var Line = null; // class
var line1 = null; // instance



// -----------------------------------------------------
// utility functions
// -----------------------------------------------------
function getRandom(min, max){
    return Math.floor(Math.random() * ( (max + 1) - min  ) + min);
}

// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup(){
    size(screenWidth, screenHeight);
    frameRate(30);
    smooth();
    background(90);

    line1 = new Line(0, screenHeight / 2, 20, 20);
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
void draw(){
    line1.draw();
}


Line = function (sX, sY, stepX, stepY){
    this.sX = sX;
    this.sY = sY;
    this.eX = sX + 10;
    this.eY = sY + 10;
    this.stepX = stepX;
    this.stepY = stepY;
}

Line.prototype.update = function(){
    var tmpSX = this.sX;
    var tmpSY = this.sY;
    this.sX = this.eX;
    this.sY = this.eY;
    this.eX = tmpSX + this.stepX;
    var center = screenHeight / 2;
    var stepY = getRandom( -(this.stepY/2), this.stepY/2 );
    this.eY += stepY;
}

Line.prototype.draw = function(){

    if ( this.sX > screenWidth ) return false;

    stroke(255);
    strokeWeight(2);
    line(this.sX, this.sY, this.eX, this.eY);
    this.update();
}
