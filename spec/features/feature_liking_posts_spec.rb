require 'rails_helper'
RSpec.feature 'Post likes', type: :feature do
  before(:each) { visit('/') }
  scenario 'user can like posts' do
    signup_login_and_view_posts
    like_a_post
    expect(page).to have_content('Liked 1 times')
  end
end
