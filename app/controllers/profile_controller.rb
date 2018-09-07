class ProfileController < ApplicationController

  def index
    @user = params[:user].nil? ? current_user : User.find(params[:user])
    tim = @user.id
    @all_posts = Post.where(user_id: tim)
  end

end
