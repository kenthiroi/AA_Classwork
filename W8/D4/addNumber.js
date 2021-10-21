const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCb) {
  if (numsLeft === 0) {
    reader.close();
    return completionCb(sum);
  }
  reader.question("add number to Sum: ", function(answer) {
    sum += parseInt(answer);
    console.log(sum);
    return addNumbers(sum, numsLeft-1, completionCb);
  })
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));