import React from "react"
import PropTypes from "prop-types"
class Post extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className="postBody" align="center">
        <div className = "postHead" align="center">
          
          
        </div>
        <div className = "postBody">
          
        </div>
      </div>
      </React.Fragment>
    );
  }
}

Post.propTypes = {
  posts: PropTypes.instanceOf(Object)
};
export default Post
