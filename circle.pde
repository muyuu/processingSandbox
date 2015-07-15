
// -----------------------------------------------------
// global variables
// -----------------------------------------------------
var screenWidth = document.body.offsetWidth;
var screenHeight = document.body.offsetHeight;

var R = 6;

var NUMBER = 100;

var circles = [];



// -----------------------------------------------------
// utility functions
// -----------------------------------------------------

/**
 * 引数間の整数をランダムに取得
 * @param  {number} min min number
 * @param  {number} max max number
 * @return {number}     random number
 */
function getRandom (min, max){
  return Math.floor ( Math.random() * ( (max + 1) -  min  ) + min );
}


/**
 * -max から max までの0以外の整数をランダムで取得
 * @param  {number} max max number
 * @return {number}     random number
 */
function getDoubleRandomNotZero (max) {
  var rand = getRandom(1, max);
  var zeroOne = getRandom(0, 1);
  if ( zeroOne === 1 ) rand = - rand;
  return rand;
}



// -----------------------------------------------------
// processing init
// -----------------------------------------------------
void setup(){

  size(screenWidth, screenHeight);
  frameRate(20);
  noFill();
  stroke(255,255,255);

  for ( var i = 1; i < NUMBER; i++ ) {
    circles.push( new Circle(
        getRandom(10, document.body.offsetWidth),
        getRandom(10, document.body.offsetHeight),
        getRandom(4, 20),
        getRandom(10, 60),
        getDoubleRandomNotZero(20),
        getDoubleRandomNotZero(20)
      )
    );
  }
}


// -----------------------------------------------------
// processing draw
// -----------------------------------------------------
void draw() {
    background(0);
    var length = circles.length;
    for ( var i = 0; i < length; i++ ) {
        circles[i].draw();
    }
}




// -----------------------------------------------------
// circle class
// -----------------------------------------------------
var Circle = function (x, y, r, speed, vectorX, vectorY){
    this.x = x;
    this.y = y;
    this.r = r;
    this.vectorX = vectorX;
    this.vectorY = vectorY;
    this.speed = speed
};

Circle.prototype.draw = function (){
    this.update();
    ellipse(this.x, this.y, this.r * 2, this.r * 2)
};

Circle.prototype.update = function (){
    this.check();
    this.move();
};



/**
 * 左端にいるか否か
 * @return {Boolean} 左端にいる場合はtrue
 */
Circle.prototype.isLeftBorder = function (){
    return this.x < 0;
};

/**
 * 右端にいるか否か
 * @return {Boolean} 右端にいる場合はtrue
 */
Circle.prototype.isRightBorder = function (){
    return !! ( (this.x + this.r) > screenWidth );
};


/**
 * 進行方向を右に変えるか否かの判定
 * @return {Boolean} 右ならtrue、左ならfalse
 */
Circle.prototype.isVectorRight = function (){
    return this.vectorX > 0 && this.isRightBorder();
};
/**
 * 進行方向を左に変えるか否かの判定
 * @return {Boolean} 右ならtrue、左ならfalse
 */
Circle.prototype.isVectorLeft = function (){
    return this.vectorX < 0 && this.isLeftBorder();
};

/**
 * 横方向の方向を変えるか否かの判定
 * @return {Boolean} 方向を変更する必要がある場合はtrue
 */
Circle.prototype.isChangeVectorX = function (){
  return this.isVectorLeft() || this.isVectorRight();
}

/**
 * x軸の進行方向をセットする
 */
Circle.prototype.setVectorX = function (){
    if ( !this.isChangeVectorX() ) return false;
    this.vectorX = - this.vectorX;
};


Circle.prototype.check = function (){
  this.setVectorX();
};

Circle.prototype.move = function (){
  this.moveX();
};

Circle.prototype.moveX = function (){
  this.x += this.vectorX;
};
