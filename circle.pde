// -----------------------------------------------------
// global variables
// -----------------------------------------------------
var screenWidth = document.body.offsetWidth;
var screenHeight = document.body.offsetHeight;

var NUMBER = 100;

var circles;


// -----------------------------------------------------
// utility functions
// -----------------------------------------------------

/**
 * 引数間の整数をランダムに取得
 * @param  {number} min min number
 * @param  {number} max max number
 * @return {number}     random number
 */
function getRandom(min, max){
    return Math.floor(Math.random() * ( (max + 1) - min  ) + min);
}


/**
 * 正規分布ランダム
 * @param  {number} min min number
 * @param  {number} max max number
 * @return {number}     random number
 */
function normalDistributionRandom(min, max){
    var count = 8;
    return _.reduce(_.range(count), function(memo){
            return memo + getRandom(min, max);
        }, 0) / count;
}


/**
 * -max から max までの0以外の整数をランダムで取得
 * @param  {number} max max number
 * @return {number}     random number
 */
function getDoubleRandomNotZero(max){
    var rand = normalDistributionRandom(1, max);
    var zeroOne = getRandom(0, 1);
    if (zeroOne === 1) rand = -rand;
    return rand;
}


// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup()
{

    size(screenWidth, screenHeight);
    frameRate(20);
    noFill();
    stroke(255, 255, 255);

    circles = _.map(_.range(NUMBER), function(){
        return new Circle(
            getRandom(10, document.body.offsetWidth), // x
            getRandom(10, document.body.offsetHeight), // y
            getRandom(4, 20), // r
            getDoubleRandomNotZero(5), // vectorX
            getDoubleRandomNotZero(5), // vectorY
            getRandom(100, 254) // lightness
        );
    });
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
void draw()
{
    background(33, 66, 99);
    var length = circles.length;

    _.each(circles, function(val){
        val.draw();
    });
}


// -----------------------------------------------------
// circle class
// -----------------------------------------------------
var Circle = function(x, y, r, vectorX, vectorY, lightness){
    this.x = x;
    this.y = y;
    this.r = r;
    this.vectorX = vectorX;
    //this.vectorY = vectorY;
    this.lightness = lightness;
};

Circle.prototype.draw = function(){
    this.update();
    smooth();
    noFill();
    stroke(this.lightness, this.lightness, 255);
    strokeWeight(2);
    ellipse(this.x, this.y, this.r * 2, this.r * 2)
};

Circle.prototype.update = function(){
    this.check();
    this.move();
};


/**
 * 左端にいるか否か
 * @return {Boolean} 左端にいる場合はtrue
 */
Circle.prototype.isLeftBorder = function(){
    return ( this.x - this.r ) < 0;
};

/**
 * 右端にいるか否か
 * @return {Boolean} 右端にいる場合はtrue
 */
Circle.prototype.isRightBorder = function(){
    return (this.x + this.r) > screenWidth;
};


/**
 * 進行方向を右に変えるか否かの判定
 * @return {Boolean} 右ならtrue、左ならfalse
 */
Circle.prototype.isVectorRight = function(){
    return this.vectorX > 0 && this.isRightBorder();
};
/**
 * 進行方向を左に変えるか否かの判定
 * @return {Boolean} 右ならtrue、左ならfalse
 */
Circle.prototype.isVectorLeft = function(){
    return this.vectorX < 0 && this.isLeftBorder();
};

/**
 * 横方向の方向を変えるか否かの判定
 * @return {Boolean} 方向を変更する必要がある場合はtrue
 */
Circle.prototype.isChangeVectorX = function(){
    return this.isVectorLeft() || this.isVectorRight();
};


/**
 * x字句の移動方向をセット
 * 横方向の方向を変える必要があれば移動距離を - 値にする
 */
Circle.prototype.setVectorX = function(){
    if (!this.isChangeVectorX()) return false;
    this.vectorX = -this.vectorX;
};


Circle.prototype.check = function(){
    this.setVectorX();
};

Circle.prototype.move = function(){
    this.moveX();
};

Circle.prototype.moveX = function(){
    this.x += this.vectorX;
};
