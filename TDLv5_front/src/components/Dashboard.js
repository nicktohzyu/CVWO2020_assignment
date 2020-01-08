import React, { Component } from "react";
import axios from "axios";

export default class Dashboard extends Component {
  constructor(props) {
    super(props);

    this.handleLogoutClick = this.handleLogoutClick.bind(this);
  }
  handleLogoutClick() {
    axios
      .delete("http://localhost:3001/logout", { withCredentials: true })
      .then(response => {
        this.props.handleLogout();
      })
      .catch(error => {
        console.log("logout error", error);
      });
  }

  render() {
    return (
        <div>
          <button onClick={() => this.handleLogoutClick()}>Logout</button>
          <h1>Dashboard</h1>
          <h1>Status: {this.props.loggedInStatus}</h1>
        </div>
    );
  }
}
