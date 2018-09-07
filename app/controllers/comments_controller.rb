class CommentsController < ApplicationController

  def index

  end

  def create
    p params
    @post = Post.find(params['post_id'])
    @comment = @post.comments.create(comment_params)
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(username: current_user.username)
  end
end
