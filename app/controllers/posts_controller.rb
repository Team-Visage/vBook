class PostsController < ApplicationController
  def new
    authenticate_user!
    @post = Post.new
  end

  def create
    if !post_params.nil?
      @post = Post.create(post_params)
    end
    redirect_to posts_url
  end

  def login
    redirect_to users_sign_in
  end

  def index
    @posts = Post.all
  end

  def like

  end

  private

  def add_likes_to_post(params)
    authenticate_user!
    @post = Post.find(params[:posts][:id])
    @post.post_likes += 1
    @post.save
    params = nil
  end

  def post_params
    if !params[:post].nil?
      p params[:post]
      message = params[:post][:message]
      { message: message, user_id: current_user.id }
    else
      add_likes_to_post(params)
    end
  end
end
