class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable, :lockable, :timeoutable, :trackable

  has_one :profile, dependant: :destroy
  after_create :init_profile

  attr_writer :login

  def init_profile
    self.create_profile!
  end

  def login
    @login || self.username || self.email
  end

end
