// -----------------------------------------------------
// global variables
// -----------------------------------------------------
var screenWidth = document.body.offsetWidth;
var screenHeight = document.body.offsetHeight;

var NUMBER = 1;

var rings;


// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup()
{

    size(screenWidth, screenHeight);
    frameRate(30);
    smooth();
    background(255);

    rings = _.map(_.range(NUMBER), function(val, index){
        return new Ring( (1  + index ) );
    });
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
void draw()
{
    _.each(rings, function(val){
        val.draw();
    });
}


// -----------------------------------------------------
// circle class
// -----------------------------------------------------
var Ring = function(r){
    this.r = r;
};

Ring.prototype.draw = function(){
    this.update();
    fill(255, 255, 255, 50);
    stroke(30);
    strokeWeight(1);
    smooth();
    ellipse(width / 2, height / 2, this.r * 2, this.r * 2);
};

Ring.prototype.update = function(){
    this.swell();
};
Ring.prototype.swell = function(){
    this.r += 1;
};



