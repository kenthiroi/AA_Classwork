Array.prototype.myEach = function(callback) {
  for (i = 0; i < this.length; i++) {
    callback(this[i]);
  }
}

// let testArr = [2,5,10];
// let timesThree = function(n) {
//     return n * 3;
// }

Array.prototype.myMap = function(callback) {
  let newArr = [];

  this.myEach(function(ele) {
    newArr.push(callback(ele));
  })

  // newArr.myEach(callback)
  
  // for (i = 0; i < this.length; i++) {
  //   newArr.push(callback(this[i]))
  // }

  return newArr;
}

let testArr = [5,20, 50];
let divideByFive = function(n) {
  return n / 5;
}