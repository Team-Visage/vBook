class PostsController < ApplicationController

  helper_method :getUser

  def new
    @post = Post.new # msg, user, likes etc
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    message = params.require(:post).permit(:message)[:message]
    { message: message, user_id: current_user.id }
  end

  def getUser(post)
    return User.find(post.user_id)
  end
end
