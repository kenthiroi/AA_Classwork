const View = require('./ttt-view.js');// require appropriate file
const Game = require('../ttt_node/game.js');
window.View = View;
document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  const g = new Game();
  const el = document.getElementsByClassName('ttt')[0];
  const view = new View(g, el);
});
