import React from "react"
import PropTypes from "prop-types"
class NewPost extends React.Component {
  render () {
    return (
      <React.Fragment>
        <label>Message:</label>
        <textarea className="newPost" id="newPostSubmit" onClick={() => this.setMessageBoxText('') }>
        Whats on your mind?
        </textarea>
        <button id="submitPost" onClick={() => this.submitPost()}>Submit</button>
      </React.Fragment>
    );
  }

  submitPost() {
    var message = this.getMessageBoxText()
    // submit request
  }
  
  setMessageBoxText (text) {
    document.getElementById('newPostSubmit').value = text
  }
  
  getMessageBoxText() {
    return document.getElementById('newPostSubmit').val()
  }

}


NewPost.propTypes = {
  user: PropTypes.instanceOf(Object)
};
export default NewPost
