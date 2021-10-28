const clockElement = document.getElementById('clock');
import { htmlGenerator } from "./warmup";

class Clock {
    constructor() {
        this.date = new Date();
        this.hours = this.date.getHours();
        this.minutes = this.date.getMinutes();
        this.seconds = this.date.getSeconds();
        this.printTime();  
        this.tick = 1000;
        setInterval(this._tick.bind(this), this.tick);        
    }
    
    printTime() {
        //   console.clear();
        const outputString = `${this.hours}:${this.minutes}:${this.seconds}`
        //   console.log(`${this.hours}:${this.minutes}:${this.seconds}`);
        htmlGenerator(outputString, clockElement);
    }
    
    _tick() {
        this._incrementSeconds();
        this.printTime();
    }
    
    _incrementSeconds() {
        this.seconds += 1;
        if (this.seconds === 60) {
            this._incrementMinutes();
            this.seconds = 0;
        }
    }
    
    _incrementMinutes() {
        this.minutes += 1;
        if (this.minutes === 60) {
            this._incrementHours();
            this.minutes = 0;
        }
    }
    
    _incrementHours() {
        this.hours += 1;
        if (this.hours === 24) {
            this.hours = 0;
      }
    }
}
//   const clock = new Clock();
const clock = new Clock();