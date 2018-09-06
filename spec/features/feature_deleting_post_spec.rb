require 'rails_helper'
RSpec.feature 'Editing posts', type: :feature do
  before(:each) do
    visit('/')
  end
  scenario 'User can edit a post' do
    signup_login_and_view_posts
    id = Post.where(message: 'hello i am a test message').first.id
    click_button("delete#{id}")
    expect(page).to have_no_content('hello i am a test message')
  end
end

