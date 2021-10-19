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