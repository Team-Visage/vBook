import React from "react"
import PropTypes from "prop-types"
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
        {this.renderSinglePost()}
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
              postCreator={post.user_id}
              postDate={post.created_at}
              postBody={post.message}
              postComments={post.comments}
            />
          )
        })}
      </div>
    )
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
        <h3>{this.props.postUser.username}</h3>
        <img src={this.props.postUser.image_url} height='50px'/>
        Posted at {this.props.post.created_at}
      </div>
    )
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

  displayComment(comment){
    return(
      <div className='comment'>
        <p>{comment.username}: {comment.body}</p>
      </div>
    )
  }

  commentsDisplay(){
    var commentList = this.props.postComments
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

  likePost(){
    return(
      <div>
        <form method='post' action={`/like?post[id]=${this.props.post.id}`}>
          <button id={`like${this.props.post.id}`} type='Submit'>Like</button>
        </form>
      </div>
    )
  }

  onSubmit(event) {
    event.preventDefault()
  }

  postLike(){

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
