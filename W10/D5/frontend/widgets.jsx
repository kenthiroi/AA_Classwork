import React from "react";
import ReactDOM from "react-dom";
import Root from "./root";
import Clock from "./clock";

document.addEventListener("DOMContentLoaded", () => {
  let main = document.getElementById("main");
  ReactDOM.render(<Root/>, main);
  ReactDOM.render(<Clock/>, main);
})