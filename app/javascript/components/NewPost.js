import React from "react"
import PropTypes from "prop-types"
class NewPost extends React.Component {
  render () {
    return (
      <React.Fragment>
        <label>Message:</label>
        <textarea className="newPost" id="newPostSubmit" defaultValue="Whats on your mind?" onClick={() => this.setMessageBoxText('') }>
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
    return document.getElementById('newPostSubmit').value
  }

}


NewPost.propTypes = {
  user: PropTypes.instanceOf(Object)
};
export default NewPost
