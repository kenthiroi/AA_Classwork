Array.prototype.uniq = function() {
  let uniqArr = [];
  for (i = 0; i < this.length; i++) {
    if (!uniqArr.includes(this[i])) {
      uniqArr.push(this[i]);
    }
  }

  return uniqArr;
}

Array.prototype.twoSum = function() {
  let sumsToZero = [];
  for (i = 0; i < this.length; i++) {
    if (this[i][0] + this[i][1] === 0) {
      sumsToZero.push(this[i]);
    }
  }

  return sumsToZero;
}

// [[1,-1], [1,2], [3, 5], [-2, 2]]

Array.prototype.transpose = function() {
  let newHeight = this[0].length;
  let newLength = this.length;
  let newMatrix = new Array(newLength);
  for (m = 0; m < newMatrix.length; m++) {
    newMatrix[m] = new Array(newHeight);
  }
  for (i = 0; i < this.length; i++) {
    for (y = 0; y < this[0].length; y++) {
      newMatrix[y][i] = this[i][y];
    }
  }

  return newMatrix; 
}

// let matrix = [[2, 2], [4, 3], [1, 9]].transpose();
// console.log(matrix);
// console.log("refreshed");
// console.log([1, 2, 3]);