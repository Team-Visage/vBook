class PostsController < ApplicationController
  def new
    p authenticate_user!
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def login
    redirect_to users_sign_in
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    message = params.require(:post).permit(:message)
    { message: message[:message], username: current_user.email }
  end
end
