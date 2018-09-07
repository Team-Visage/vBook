require 'rails_helper'
RSpec.feature 'User can comment', type: :feature do
  before(:each) { visit('/') }
  scenario 'User can comment on posts', :js => true do
    signup_login_and_view_posts
    save_and_open_page
    comment_on_a_post
    expect(page).to have_content('hey babe')
  end
  scenario 'cannot log out when not logged in' do
    expect(page).to_not have_content('Logout')
  end
end