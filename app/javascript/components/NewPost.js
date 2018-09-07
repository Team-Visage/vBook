import React from "react"
import PropTypes from "prop-types"
class NewPost extends React.Component {

  constructor() {
    super()
    this.state = {
      newPostActive: false,
      newPostText: '',
      profileActive: false
    }
  }

  render () {
    return (
      <React.Fragment>
        <div className='MenuBar'>
          <button className="menuButton" id='newPostActiveButton' onClick={() => this.setState({newPostActive: true})}>New Post</button>
          <button className="menuButton" id="Profile" onClick={() => window.location='/profile'}>Profile</button>
          <button className="menuButton" id="Home" onClick={() => window.location='/'}>Home</button>
        </div>
        {this.newPost()}
      </React.Fragment>
    );
  }

  newPost() {
    if(this.state.newPostActive) {
      return (
        <div className = 'newPostDiv'>
          <form method = 'post' action = {`/posts?post[message]=${this.state.newPostText}`}>
            <textarea id='NewPostTextInput' onChange={this.updateNewPost.bind(this)}></textarea>
            <button id='newPostSubmit'>Submit</button>
          </form>
        </div>
      )
    } else {
      console.log(this.state.newPostActive)
    }
  }

  updateNewPost(e) {
    this.setState({ newPostText: e.target.value })
  }
}

export default NewPost
