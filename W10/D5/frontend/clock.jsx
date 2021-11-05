import React from "react"

class Clock extends React.Component{
  constructor(){
    super();
    this.state = { time: new Date() }; 
    this.tick = this.tick.bind(this);
    this.interval;
  }

  componentDidMount(){
    this.interval = setInterval(
      this.tick
      , 1000);
  }

  componentWillUnmount(){
    clearInterval(this.interval);
  }

  render(){
    return (
      <h1>{this.state.time.getHours()}:{this.state.time.getMinutes()}:{this.state.time.getSeconds()}</h1>
    )
  }

  tick(){
    this.setState({time: new Date()});
  }
}

export default Clock;