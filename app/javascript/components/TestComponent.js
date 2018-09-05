import React from "react"
import PropTypes from "prop-types"
class TestComponent extends React.Component {

  render () {
    return (
      <React.Fragment>
        <div className = "profileBody" align="center">
          <div className = "profileNameHeader">
          {this.props.hello.username}
          </div>
          <div className = "profileImageDiv">
            <img src={`${this.props.hello.image_url}`} className = "profilePicture"></img>
          </div>
          <div className = "profileBio">
            {this.props.hello.bio_desc}
          </div>
        </div>
      </React.Fragment>
    );
  }
}

TestComponent.propTypes = {
  hello: PropTypes.instanceOf(Object)
};
export default TestComponent
