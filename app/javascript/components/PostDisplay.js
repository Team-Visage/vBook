import React from "react"
import PropTypes from "prop-types"
import NewPost from "./NewPost"
import Post from "./Post"
class PostDisplay extends React.Component {

  constructor() {
    super()
    this.state = {
      userLoggedIn: true,
      newPost: false
    }

  }

  render () {
    return (
      <React.Fragment>
      <div id="Header">
        <button id="newPostCreate" onClick={() => this.setState({newPost: true})}>New Post</button>
      </div>
      {this.renderAllPosts()}
      {this.newPost()}
      </React.Fragment>   
    )
  }



  renderAllPosts() {
    return (  
        <Post/>
    );
  }

  newPost() {
    if(this.state.newPost) {
      return (
       <NewPost />
      )
    }
  }

}

PostDisplay.propTypes = {
  post: PropTypes.instanceOf(Object),
  user: PropTypes.instanceOf(Object)
};
export default PostDisplay
