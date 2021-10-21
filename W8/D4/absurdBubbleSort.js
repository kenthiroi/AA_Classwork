const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Write this first.
function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
 
  reader.question(`${el1} less than ${el2}?: `, answer => {
    let bool;
    if (answer === 'n') {
      callback(true);
    } else if (answer === 'y') {
      callback(false);
    } else {
      console.log("ur stooopid")
      askIfGreaterThan(el1, el2, callback)
    }
    // reader.close();
  })
}

// Once you're done testing askIfGreaterThan with dummy arguments, write this.
function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  // Do an "async loop":
  // 1. If (i == arr.length - 1), call outerBubbleSortLoop, letting it
  //    know whether any swap was made.
  if (i === arr.length - 1) {
    outerBubbleSortLoop(madeAnySwaps);
  }
  // 2. Else, use `askIfGreaterThan` to compare `arr[i]` and `arr[i +
  //    1]`. Swap if necessary. Call `innerBubbleSortLoop` again to
  //    continue the inner loop. You'll want to increment i for the
  //    next call, and possibly switch madeAnySwaps if you did swap.
  else {
    askIfGreaterThan(arr[i], arr[i + 1], (bool) => {
      if (bool) {
        let temp = arr[i];
        arr[i] = arr[i+1];
        arr[i+1] = temp;
      }
      i += 1;
      madeAnySwaps = madeAnySwaps || bool;
      innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop);
    });
  }
}

// Once you're done testing innerBubbleSortLoop, write outerBubbleSortLoop.
// Once you're done testing outerBubbleSortLoop, write absurdBubbleSort.

function absurdBubbleSort(arr, sortCompletionCallback) {
  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});

// askIfGreaterThan(1, 2, red => console.log(red));

// const arr=[1,2,4,5,3];
// innerBubbleSortLoop(arr, 0, false, (bool)=>{
//   console.log(bool);
//   reader.close();
// });