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

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_url
  end

  def destroy
    @post = Post.find(params[:id])
    while @comment = Comment.find_by(post_id: @post.id) do
      @comment.destroy
    end
    @post.destroy
    redirect_to posts_url
  end

  private

  def post_params
    params.require(:post).permit(:message).merge(user_id: current_user.id)
  end

  def getUser(post)
    return User.find(post.user_id)
  end
end
