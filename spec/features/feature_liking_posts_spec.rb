require 'rails_helper'
RSpec.feature 'Post likes', type: :feature do
  before(:each) { visit('/') }
  scenario 'user can like posts' do
    signup_login_and_view_posts
    like_a_post
    expect(page).to have_content('Liked 1 times')
  end
  scenario 'user can only like a post once' do
    signup_login_and_view_posts
    like_a_post
    like_a_post 
    expect(page).to have_content('Liked 1 times')
    expect(page).to_not have_content('Liked 2 times')
    save_and_open_page
  end
end
