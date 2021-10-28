const Game = require("../ttt_node/game");


class View {
  constructor(game, gameview) {
    this.game = game;
    this.gameview = gameview;
    this.setupBoard();
  }



  setupBoard() {
    const ul = document.createElement("ul");
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        const el = document.createElement("li");
        el.setAttribute("data-pos", `${i}-${j}`);
        el.setAttribute("class", "square");
        ul.appendChild(el);
      }
    }
    this.gameview.appendChild(ul);
    this.bindEvents();
  }
  
  bindEvents() {
    const squares = document.getElementsByClassName("square");
    for (let i = 0; i < squares.length; i++) {
      const square = squares[i];
      const position = square.getAttribute("data-pos").split("-");
      square.addEventListener("click", event => {
        this.handleClick(event.target);
        this.makeMove(position);
      });

    }
  }

  handleClick(e) {
    e.textContent = this.game.currentPlayer;
    e.style.backgroundColor = "white";
  }

  makeMove(square) {
    this.game.playMove(square);
    if (this.game.isOver()) {
      const winner = document.createElement("p");
      winner.textContent = `${this.game.winner()} is the winner!`;
      this.gameview.appendChild(winner);
      this.game = new Game();
      setTimeout( () => {
        this.removeAllChildNodes(this.gameview);
        this.setupBoard();
      }, 2000);
    }
  }
  
  removeAllChildNodes(parent) {
    while (parent.firstChild) {
        parent.removeChild(parent.firstChild);
    }
  }

}

module.exports = View;


// create 9 length array
// loop over
// save an id tag with i and j values from nested loop to each li
// set vals in 3x3 array = doc elements created
// 
