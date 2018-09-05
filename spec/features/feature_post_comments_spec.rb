require 'rails_helper'
#require '../app/models/post'
RSpec.feature 'User can comment', type: :feature do
  before(:each) { visit('/') }
  scenario 'User can comment on posts' do
    add_test_data_to_db
    login_to_acebook
    send_test_msg
    id = Post.where(message: 'hello i am a test message').first.id
    fill_in("comment#{id}",	with: 'hey babe')
    click_button("submitComment#{id}")
    expect(page).to have_content('hey babe')
  end
  scenario 'cannot log out when not logged in' do
    expect(page).to_not have_content('Logout')
  end
end
