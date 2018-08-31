require 'rails_helper'
require_relative '../app/models/user'
require_relative '../app/models/post'

def test_login
  { email: 'atestemail@gmail.com',
    password: 'eu3838hjd32d3'
  }
end

def test_user
  {
    email: 'UWotM8@hotmail.com',
    password: '1234567',
    confirmed_at: '2018-08-29 08:52:47.366617',
    username: "uwotm8"
  }
end

def test_post
  {
    message: 'hello i am a test message',
    created_at: '2018-08-29 08:52:47.366617',
    user_id: User.where(username: 'uwotm8').first.id
  }
end

def logout_of_acebook
  visit('/')
  click_link('Sign Out')
end

def login_to_acebook
  click_link('Sign In To Your Account')
  fill_in('user_email',	with: 'UWotM8@hotmail.com')
  fill_in('user_password',	with: '1234567')
  click_button('Log in')
end

def sign_up_to_acebook
  click_link('Sign In To Your Account')
  click_link('Sign up')
  fill_in('user_email',	with: 'UWotM8@hotmail.com')
  fill_in('user_username',	with: 'UWotM8')
  fill_in('user_password',	with: '1234567')
  fill_in('user_password_confirmation',	with: '1234567')
  click_button('Sign up')
end

def send_test_msg
  click_link('New post')
  fill_in('Message', with: 'Hello, world!')
  click_button('Submit')
end

def add_test_data_to_db
  User.create(test_user)
  Post.create(test_post)
end
