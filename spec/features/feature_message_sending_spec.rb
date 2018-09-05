require 'rails_helper'
RSpec.feature 'Public Messaging', type: :feature do
  before(:each) do
    add_test_data_to_db
    visit('/')
    login_to_acebook
    visit('/posts')
  end
  scenario 'User can see list of messsages' do
    expect(page).to have_content('New post')
    expect(page).to have_content('hello i am a test message')
  end
  scenario 'User cannot post message if not logged in' do
    logout_of_acebook
    visit('/posts')
    expect(page).to have_content('You need to sign in or sign up before continuing')
  end
  scenario 'Logged in user can post a message and see it displayed' do
    visit('/posts')
    send_test_msg
    expect(page).to have_content('Hello, world!')
  end
end
