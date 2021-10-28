const Game = require("./game");

function GameView(ctx) {
  this.ctx = ctx;
  this.game = new Game;
  // key('up', function(){ this.ship.power() });
}

GameView.prototype.start = function() {
  setInterval(() => {
    this.game.step();
    this.game.draw(this.ctx);
  },20);
}

GameView.prototype.bindKeyHandlers = function() {

}

module.exports = GameView;