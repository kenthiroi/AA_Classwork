const MovingObject = require("./moving_object");
const Util = require("./util");


function Ship(option, game) {
  this.RADIUS = 10;
  this.COLOR = "#ADD8E6";
  MovingObject.call(this, 
    {pos: option.pos, vel: [0, 0], radius: this.RADIUS, color: this.COLOR, game: game}
  );
}

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = [0, 0];
}

Ship.prototype.power = function(impulse) {

}

Util.inherits(Ship, MovingObject);

module.exports = Ship;