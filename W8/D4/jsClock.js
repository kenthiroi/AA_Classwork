class Clock {
  constructor() {
    // 1. Create a Date object.
    let date = new Date();
    // 2. Store the hours, minutes, and seconds.
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals.
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    let stringHours;
    let stringMinutes; 
    let stringSeconds;
    if (this.hours < 10) {
      stringHours = `0${this.hours}`;
    } else {
      stringHours = `${this.hours}`;
    }
    if (this.minutes < 10) {
      stringMinutes = `0${this.minutes}`;
    } else {
      stringMinutes = `${this.minutes}`;
    }
    if (this.seconds < 10) {
      stringSeconds = `0${this.seconds}`;
    } else {
      stringSeconds = `${this.seconds}`;
    }
    let formattedTime = `${stringHours}:${stringMinutes}:${stringSeconds}`;
    // Use console.log to print it.
    console.log(formattedTime);
  }

  _tick() {
    // 1. Increment the time by one second.
    if (this.seconds < 59) {
      this.seconds += 1;
    } else {
      this.seconds = 0;
      if (this.minutes < 59) {
        this.minutes += 1;
      } else {
        this.minutes = 0;
        if (this.hours < 24) {
          this.hours += 1;
        } else {
          this.hours = 0;
        }
      }
    }
    // 2. Call printTime.
    // Clock.prototype.printTime();
    this.printTime();
  }
}

const clock = new Clock();