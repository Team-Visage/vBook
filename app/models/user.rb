class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable, :timeoutable, :trackable
  
  attr_writer :login

  def login
    @login || self.username || self.email
  end

end

