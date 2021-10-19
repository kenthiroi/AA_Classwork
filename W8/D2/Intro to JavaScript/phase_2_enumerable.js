Array.prototype.myEach(callback) = function() {
  for (i = 0; i < this.length; i++) {
    this[i].callback();
  }
}