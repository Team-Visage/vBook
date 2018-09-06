import React from "react"
import PropTypes from "prop-types"
import Post from './Post'
class PostPage extends React.Component {
  constructor(){
    super()
    this.state = {
      newComment: false,
      commentText: '',
      newPostText: '',
      editedPostText: '',
      newPostActive: false
    }
  }

  render () {
    return (
      <React.Fragment>
      <div className='MenuBar'>
        <button id='newPostActiveButton' onClick={() => this.setState({newPostActive: true})}>New Post</button>
      </div>
        {this.newPost()}
        {this.renderAllPosts()}
      </React.Fragment>
    );
  }

  renderAllPosts() {
    return (
      <div className = 'postMainDiv'>
        {this.props.postList.map(function(post){
          return (
            <Post
              key={post.id}
              postAuthor={post.user_id} 
              post = {post}
            />
          )
        })}
      </div>
    )
  }

  newPost() {
    if(this.state.newPostActive) {
      return (
        <div className = 'newPostDiv'>
          <form method = 'post' action = {`/posts?post[message]=${this.state.newPostText}`}>
            <label><h3>Message</h3></label>
            <textarea id='NewPostTextInput' onChange={this.updateNewPost.bind(this)}></textarea>
            <button id='newPostSubmit'>Submit</button>
          </form>
        </div>
      )
    } else {
      console.log(this.state.newPostActive)
    }
  }

  updateComment(e) {
    this.setState({ commentText: e.target.value })
  }

  updateNewPost(e) {
    this.setState({ newPostText: e.target.value })
  }

  editPost(e) {
    this.setState({ editedPostText: e.target.value })
  }

  postComment() {
    this.setState({newComment: false})
  }
}

PostPage.propTypes = {
  post: PropTypes.instanceOf(Object),
  currentUser: PropTypes.instanceOf(Object),
  postUser: PropTypes.instanceOf(Object),
  postComments: PropTypes.instanceOf(Object),
  postList: PropTypes.instanceOf(Object)
};
export default PostPage
