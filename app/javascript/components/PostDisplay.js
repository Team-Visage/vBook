import React from "react"
import PropTypes from "prop-types"
class PostDisplay extends React.Component {

  // set state 

  render () {
    return (
      <React.Fragment>
        <div className="postBody" align="center">
          <div className = "postHead" align="center">
          <img src={this.props.user.image_url} className="postImage"></img>
          {this.props.post.created_at}
          {this.props.user.username}
          </div>
          <div className = "postBody">
          {this.props.post.message}
          </div>
        </div>
      </React.Fragment>
    );
  }
}

PostDisplay.propTypes = {
  post: PropTypes.instanceOf(Object),
  user: PropTypes.instanceOf(Object)
};
export default PostDisplay
