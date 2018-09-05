require 'rails_helper'
RSpec.feature 'Post likes', type: :feature do
  before(:each) { visit('/') }
  scenario 'user can like posts' do
    add_test_data_to_db
    login_to_acebook
    click_link("View Posts")
    id = Post.where(message: 'hello i am a test message').first.id
    save_and_open_page
    click_button("like#{id}")
    expect(page).to have_content('Liked 1 times')
  end
end
