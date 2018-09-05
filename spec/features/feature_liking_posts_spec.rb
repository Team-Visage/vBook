require 'rails_helper'
RSpec.feature 'Post likes', type: :feature do
  before(:each) { visit('/') }
  scenario 'user can like posts' do
    add_test_data_to_db
    login_to_acebook
    click_link("View Posts")
    click_button("Like").first
    expect(page).to have_content('Liked 1 times')
  end
end
