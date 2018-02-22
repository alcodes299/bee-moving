import React, { Component } from 'react';

class Basics extends Component {
  constructor(props) {
    super(props);
    this.state = {
      iss_long: [],
      iss_last: []
    }
  }
  componentDidMount() {
    fetch('http://api.open-notify.org/iss-now.json')
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
            error = new Error(errorMessage);
        throw(error);
      }
    })
    .then(response => response.json())
    .then(body => {
      
      this.setState({ iss_long: body.iss_position.longitude ,iss_lat: body.iss_position.latitude })
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));

  }

  render() {


    return(
      <div>
        <h1>Iss current coordinates</h1>
        <h3>lat: {this.state.iss_lat} long: {this.state.iss_long}</h3>
      </div>
    )
  }
}


export default Basics
