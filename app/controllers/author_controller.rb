class AuthorController < ApplicationController

  def create
    p params
    # return user object
    redirect_to posts_path
  end

end
