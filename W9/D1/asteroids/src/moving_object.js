// class MovingObject {
//   constructor(objectData) {
//     this.pos = objectData["pos"];
//     this.vel = objectData["vel"];
//     this.radius = objectData["radius"];
//     this.color = objectData["color"];
//   }

//   draw(ctx) {
//     ctx.beginPath();
//     ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
//     ctx.fillStyle = this.color;
//     ctx.fill();
//   }
// }

function MovingObject(objectData){
  this.pos = objectData["pos"];
  this.vel = objectData["vel"];
  this.radius = objectData["radius"];
  this.color = objectData["color"];
  this.game = objectData["game"];
}

MovingObject.prototype.draw = function(ctx) {
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
}

MovingObject.prototype.move = function() {
  this.pos[0] += this.vel[0];
  this.pos[1] += this.vel[1];
  this.game.wrap(this.pos);
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
  let dist = Math.sqrt(Math.pow(this.pos[0] - otherObject.pos[0], 2) + Math.pow(this.pos[1] - otherObject.pos[1], 2));
  return (this.radius + otherObject.radius) > dist;
}

MovingObject.prototype.collideWith = function(otherObject) {
  // this.game.remove(this);
  // this.game.remove(otherObject);
}

module.exports = MovingObject;