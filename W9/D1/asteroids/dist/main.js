/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\n\n\nfunction Asteroid(option, game) {\n  this.COLOR = \"#ff0000\";\n  this.RADIUS = 5;\n  MovingObject.call(this, \n    {pos: option.pos, vel: Util.randomVec(this.RADIUS), radius: this.RADIUS, color: this.COLOR, game: game}\n    );\n}\n\nAsteroid.prototype.collideWith = function(otherObject) {\n  if (otherObject instanceof Ship) {\n    otherObject.relocate();\n  }\n  alert('asdasd')\n}\n  \nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nfunction Game() {\n  this.DIM_X = 400;\n  this.DIM_Y = 400;\n  this.NUM_ASTEROIDS = 5;\n  this.asteroids = [];\n  this.ship = new Ship(this.randomPosition(), this);\n\n  this.addAsteroids();\n}\n\nGame.prototype.addAsteroids = function() {\n  for (let i = 0; i < 5; i++) {\n    this.asteroids.push(new Asteroid(this.randomPosition(), this));\n  }\n}\n\n\n\nGame.prototype.randomPosition = function() {\n  return {pos: [Math.floor(Math.random() * 400), Math.floor(Math.random() * 400)]}\n}\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, this.DIM_X, this.DIM_Y);\n  for (const ast of this.allObjects()) {\n    ast.draw(ctx);\n  }\n}\n\nGame.prototype.moveObjects = function() {\n  for (const ast of this.allObjects()) {\n    ast.move();\n  }\n}\n\nGame.prototype.wrap = function(pos) {\n  let newPos = pos;\n  if (pos[0] < 0) {\n    newPos[0] = 400;\n  }\n  if (pos[0] > 400){\n    newPos[0] = 0;\n  }\n  if (pos[1] < 0) {\n    newPos[1] = 400;\n  }\n  if (pos[1] > 400) {\n    newPos[1] = 0;\n  }\n\n  return newPos;\n}\n\nGame.prototype.checkCollisions = function() {\n  for (const ast1 of this.allObjects()) {\n    for (const ast2 of this.allObjects()) {\n      if (ast1 !== ast2 && ast1.isCollidedWith(ast2)) {\n        // alert(\"COLLISION!!!!!!!\");\n        ast1.collideWith(ast2);\n      }\n    }\n  }\n}\n\nGame.prototype.step = function() {\n  this.moveObjects();\n  this.checkCollisions();\n}\n\nGame.prototype.remove = function(asteroid) {\n  let astIdx = this.asteroids.indexOf(asteroid);\n  this.asteroids.splice(astIdx, 1);\n}\n\nGame.prototype.allObjects = function() {\n  return this.asteroids.concat([this.ship]);\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n  this.ctx = ctx;\n  this.game = new Game;\n  // key('up', function(){ this.ship.power() });\n}\n\nGameView.prototype.start = function() {\n  setInterval(() => {\n    this.game.step();\n    this.game.draw(this.ctx);\n  },20);\n}\n\nGameView.prototype.bindKeyHandlers = function() {\n\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\n\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Util = Util;\nwindow.Game = Game;\nwindow.GameView = GameView;\nwindow.Ship = Ship;\n\n\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n  const canvasEl = document.getElementById(\"game-canvas\");\n  canvasEl.width = 400;\n  canvasEl.height = 400;\n  const ctx = canvasEl.getContext(\"2d\");\n  window.ctx = ctx;\n\n  const gameView = new GameView(ctx);\n  gameView.start();\n\n  \n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("// class MovingObject {\n//   constructor(objectData) {\n//     this.pos = objectData[\"pos\"];\n//     this.vel = objectData[\"vel\"];\n//     this.radius = objectData[\"radius\"];\n//     this.color = objectData[\"color\"];\n//   }\n\n//   draw(ctx) {\n//     ctx.beginPath();\n//     ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n//     ctx.fillStyle = this.color;\n//     ctx.fill();\n//   }\n// }\n\nfunction MovingObject(objectData){\n  this.pos = objectData[\"pos\"];\n  this.vel = objectData[\"vel\"];\n  this.radius = objectData[\"radius\"];\n  this.color = objectData[\"color\"];\n  this.game = objectData[\"game\"];\n}\n\nMovingObject.prototype.draw = function(ctx) {\n  ctx.beginPath();\n  ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);\n  ctx.fillStyle = this.color;\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function() {\n  this.pos[0] += this.vel[0];\n  this.pos[1] += this.vel[1];\n  this.game.wrap(this.pos);\n}\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  let dist = Math.sqrt(Math.pow(this.pos[0] - otherObject.pos[0], 2) + Math.pow(this.pos[1] - otherObject.pos[1], 2));\n  return (this.radius + otherObject.radius) > dist;\n}\n\nMovingObject.prototype.collideWith = function(otherObject) {\n  // this.game.remove(this);\n  // this.game.remove(otherObject);\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\n\nfunction Ship(option, game) {\n  this.RADIUS = 10;\n  this.COLOR = \"#ADD8E6\";\n  MovingObject.call(this, \n    {pos: option.pos, vel: [0, 0], radius: this.RADIUS, color: this.COLOR, game: game}\n  );\n}\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition();\n  this.vel = [0, 0];\n}\n\nShip.prototype.power = function(impulse) {\n\n}\n\nUtil.inherits(Ship, MovingObject);\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/***/ ((module) => {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    function Surrogate() {};\n    Surrogate.prototype = parentClass.prototype;\n    childClass.prototype = new Surrogate();\n    childClass.prototype.constructor = childClass;\n  },\n\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  }\n}\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;