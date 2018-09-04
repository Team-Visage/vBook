class ProfileController < ApplicationController

  def index
    @user = params[:user].nil? ? current_user : User.find(params[:user])
  end
end
