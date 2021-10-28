const MovingObject = require("./moving_object");
const Asteroid = require("./asteroid");
const Util = require("./util");
const Game = require("./game");
const GameView = require("./game_view");
const Ship = require("./ship");



window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Util = Util;
window.Game = Game;
window.GameView = GameView;
window.Ship = Ship;


document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementById("game-canvas");
  canvasEl.width = 400;
  canvasEl.height = 400;
  const ctx = canvasEl.getContext("2d");
  window.ctx = ctx;

  const gameView = new GameView(ctx);
  gameView.start();

  
});