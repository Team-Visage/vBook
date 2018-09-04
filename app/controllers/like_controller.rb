class LikeController < ApplicationController
  def create
    @post = Post.find(params["posts"["post"]]["id"].to_i)
    @post.post_likes += 1
    @post.save
    redirect_to posts_path
  end
end
