const MovingObject = require("./moving_object");
const Util = require("./util");



function Asteroid(option, game) {
  this.COLOR = "#ff0000";
  this.RADIUS = 5;
  MovingObject.call(this, 
    {pos: option.pos, vel: Util.randomVec(this.RADIUS), radius: this.RADIUS, color: this.COLOR, game: game}
    );
}

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  }
  alert('asdasd')
}
  
Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;