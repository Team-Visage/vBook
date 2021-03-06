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

def test_user_2
  {
    email: 'UWotM8@yahoo.com',
    password: '1234567',
    confirmed_at: '2018-08-29 08:52:47.366617',
    username: 'jackIscool',
    bio_desc: 'a cool guy'
  }
end

def test_post
  {
    message: 'hello i am a test message',
    created_at: '2018-08-29 08:52:47.366617',
    user_id: User.where(username: 'uwotm8').first.id
  }
end

def test_post_2
  {
    message: 'another test message',
    created_at: '2018-08-29 08:52:47.366617',
    user_id: User.where(username: 'jackIscool').first.id
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
  User.create(test_user_2)
  Post.create(test_post)
  Post.create(test_post_2)
end

def signup_login_and_view_posts
  add_test_data_to_db
  login_to_acebook
  click_link("View Posts")
end

def like_a_post
  id = Post.where(message: 'hello i am a test message').first.id
  click_button("like#{id}")
end

def comment_on_a_post
  id = Post.where(message: 'hello i am a test message').first.id
  fill_in("comment#{id}",	with: 'hey babe')
  click_button("submitComment#{id}")
end
