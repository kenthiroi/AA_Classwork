const Asteroid = require("./asteroid");
const Ship = require("./ship");

function Game() {
  this.DIM_X = 400;
  this.DIM_Y = 400;
  this.NUM_ASTEROIDS = 5;
  this.asteroids = [];
  this.ship = new Ship(this.randomPosition(), this);

  this.addAsteroids();
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < 5; i++) {
    this.asteroids.push(new Asteroid(this.randomPosition(), this));
  }
}



Game.prototype.randomPosition = function() {
  return {pos: [Math.floor(Math.random() * 400), Math.floor(Math.random() * 400)]}
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);
  for (const ast of this.allObjects()) {
    ast.draw(ctx);
  }
}

Game.prototype.moveObjects = function() {
  for (const ast of this.allObjects()) {
    ast.move();
  }
}

Game.prototype.wrap = function(pos) {
  let newPos = pos;
  if (pos[0] < 0) {
    newPos[0] = 400;
  }
  if (pos[0] > 400){
    newPos[0] = 0;
  }
  if (pos[1] < 0) {
    newPos[1] = 400;
  }
  if (pos[1] > 400) {
    newPos[1] = 0;
  }

  return newPos;
}

Game.prototype.checkCollisions = function() {
  for (const ast1 of this.allObjects()) {
    for (const ast2 of this.allObjects()) {
      if (ast1 !== ast2 && ast1.isCollidedWith(ast2)) {
        // alert("COLLISION!!!!!!!");
        ast1.collideWith(ast2);
      }
    }
  }
}

Game.prototype.step = function() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function(asteroid) {
  let astIdx = this.asteroids.indexOf(asteroid);
  this.asteroids.splice(astIdx, 1);
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat([this.ship]);
}

module.exports = Game;