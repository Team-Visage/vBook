
class LikeController < ApplicationController
  def create
    @post = Post.find(params['posts'['post']]['id'].to_i)
    if @post.liked_by.include?(current_user.id.to_s)
      redirect_to posts_path
    else
      @post.post_likes += 1
      @post.liked_by.push(current_user.id.to_s)
      @post.save
      redirect_to posts_path
    end
  end
end
