class PostsController < ApplicationController

  helper_method :getUser

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def getUser(post)
    return User.find(post.user_id)
  end

  def like(post)
    if !current_user.liked? @post
      @post.liked_by current_user
    end
  end
end
