class AuthorController < ApplicationController

  def create
    p params
    # return user object
    @user = User.find(params[:user_id])
    return @user
  end

end
