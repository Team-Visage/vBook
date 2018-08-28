class HomeController < ApplicationController

  def home
    
  end

  def new
    redirect_to home_url
  end

end