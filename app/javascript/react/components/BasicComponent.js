import React, { Component } from 'react';
import ReactDOM from 'react-dom'

class Basics extends Component {
  constructor(props) {
    super(props);
    this.state = {
      quotes: [
                "Aerodynamically, the bumble bee shouldn't be able to fly, but the bumble bee doesn't know it so it goes on flying anyway. -unknown",
                "",
                "",
                ""
                ],
    newQuote: ''
    }
  }


  render() {

    // map quotes into a div
    return(
      <div>
        <h1>Nature Quotes,Facts,Questions, Form</h1>
      </div>
    )
  }
}


export default Basics
