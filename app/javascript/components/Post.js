import React from "react"
import PropTypes from "prop-types"
class Post extends React.Component {

  constructor() {
    super()
    this.state = {
      newComment: false,
      commentText: '',
      editedPostText: '',
      postUser: this.getPostAuthor(),
      postComment: this.getPostComments()
    }
   
  }

  render () {
    return (
      <React.Fragment>
        {this.renderSinglePost()}
      </React.Fragment>
    );
  }

  renderSinglePost() {
    return (
      <div className = 'singlePostDiv'>
      {this.postHead()}
      {this.postBody()}
      {this.commentsDisplay()}
    </div>
    )
  }

  postHead(){
    return(
      <div className='postHead'>
        Posted at {this.props.post.created_at}
      </div>
    )
  }

  getPostAuthor(id) {
    
  }

  getPostComments() {

  }

  postBody(){
    return(
      <div className='postBody'>
        <p> "{this.props.post.message}" </p>
        <p> <strong> Liked {this.props.post.post_likes} times </strong> </p>
        {this.likePost()}
      </div>
    )
  }
  likePost(){
    return(
      <div>
        <form method='post' action={`/like?post[id]=${this.props.post.id}`}>
          <button id={`like${this.props.post.id}`} type='Submit'>Like</button>
        </form>
      </div>
    )
  }

  displayComment(comment){
    return(
      <div className='comment'>
        <p>{comment.username}: {comment.body}</p>
      </div>
    )
  }

  commentsDisplay(){
    var commentList = this.props.post.postComments
    if(commentList != null){
      return(
        <div className='commentsDisplay'>
          {commentList.map(function(comment){
            return <p>{comment.username}: "{comment.body}"</p>
          })}
          {this.commentSubmit()}
        </div>
      )
    }
  }

  commentSubmit(){
    var id = this.props.post.id
    if(this.state.newComment){
      return(
        <div >
          <form method='post'>
          <textarea id={`textarea${id}`} value={this.state.commentText} onChange={this.updateComment.bind(this)}> placeholder></textarea>
          <p><button id={`submit${id}`} formAction = {`posts/${id}/comments?comment[body]=${this.state.commentText}`}>Sumbit</button></p>
          </form>
        </div>
      )
    } else{
      return (
          <div>
              <button id={`comment${this.props.post.id}`} type='Submit' onClick={() => this.setState({newComment: true})}>New Comment</button>
          </div>
      )
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
}

export default Post
