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

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\nconst clockElement = document.getElementById('clock');\n\n\nclass Clock {\n    constructor() {\n        this.date = new Date();\n        this.hours = this.date.getHours();\n        this.minutes = this.date.getMinutes();\n        this.seconds = this.date.getSeconds();\n        this.printTime();  \n        this.tick = 1000;\n        setInterval(this._tick.bind(this), this.tick);        \n    }\n    \n    printTime() {\n        //   console.clear();\n        const outputString = `${this.hours}:${this.minutes}:${this.seconds}`\n        //   console.log(`${this.hours}:${this.minutes}:${this.seconds}`);\n        ;(0,_warmup__WEBPACK_IMPORTED_MODULE_0__.htmlGenerator)(outputString, clockElement);\n    }\n    \n    _tick() {\n        this._incrementSeconds();\n        this.printTime();\n    }\n    \n    _incrementSeconds() {\n        this.seconds += 1;\n        if (this.seconds === 60) {\n            this._incrementMinutes();\n            this.seconds = 0;\n        }\n    }\n    \n    _incrementMinutes() {\n        this.minutes += 1;\n        if (this.minutes === 60) {\n            this._incrementHours();\n            this.minutes = 0;\n        }\n    }\n    \n    _incrementHours() {\n        this.hours += 1;\n        if (this.hours === 24) {\n            this.hours = 0;\n      }\n    }\n}\n//   const clock = new Clock();\nconst clock = new Clock();\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/***/ (() => {

eval("\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator() {\n  let dogLinks = [];\n  for (const [breed, link] of Object.entries(dogs)) {\n    const aTag = document.createElement(\"a\");\n    aTag.textContent = breed;\n    aTag.setAttribute(\"href\", link);\n    const liTag = document.createElement(\"li\");\n    liTag.setAttribute(\"class\", \"dog-link\");\n    liTag.appendChild(aTag);\n    dogLinks.push(liTag);\n  }\n  return dogLinks;\n}\n\nfunction attachDogLinks() {\n  const dogLinks = dogLinkCreator();\n  const dropdown = document.getElementsByClassName(\"drop-down-dog-list\")[0];\n  dogLinks.forEach((link) => dropdown.appendChild(link));\n}\n\nfunction handleEnter() {\n  const dogLinks = document.querySelectorAll(\".dog-link\");\n  dogLinks.forEach(dogLink => {\n    dogLink.classList.add(\"dropdown-open\");\n  });\n}\n\nfunction handleLeave() {\n  const dogLinks = document.querySelectorAll(\".dog-link\");\n  dogLinks.forEach(dogLink => {\n    dogLink.classList.remove(\"dropdown-open\");\n  });\n}\n\nattachDogLinks();\n\n\nconst hoverText = document.querySelector(\".drop-down-dog-nav\");\nhoverText.addEventListener(\"mouseenter\", handleEnter);\nhoverText.addEventListener(\"mouseleave\", handleLeave);\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_drop_down__WEBPACK_IMPORTED_MODULE_2__);\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"htmlGenerator\": () => (/* binding */ htmlGenerator)\n/* harmony export */ });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n    // if (htmlElement.hasChildNodes()) {\n    //     htmlElement.removeChild(htmlElement.firstChild);\n    // }\n    if (htmlElement.children) {\n        Array.from(htmlElement.children).forEach((child) => htmlElement.removeChild(child));\n      }\n    const el = document.createElement('p');\n    el.textContent = string;\n    htmlElement.appendChild(el);\n};\nhtmlGenerator('Party Time.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

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
/******/ 	/* webpack/runtime/compat get default export */
/******/ 	(() => {
/******/ 		// getDefaultExport function for compatibility with non-harmony modules
/******/ 		__webpack_require__.n = (module) => {
/******/ 			var getter = module && module.__esModule ?
/******/ 				() => (module['default']) :
/******/ 				() => (module);
/******/ 			__webpack_require__.d(getter, { a: getter });
/******/ 			return getter;
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
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