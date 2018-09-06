require 'rails_helper'
RSpec.feature 'Editing posts', type: :feature do
  before(:each) do
    visit('/')
  end
  scenario 'User can edit a post' do
    signup_login_and_view_posts
    id = Post.where(message: 'hello i am a test message').first.id
    click_button("edit#{id}")
    fill_in('Message', with: 'Edited Message')
    click_button('Submit')
    expect(page).to have_content('Edited Message')
  end
end




# save_and_open_page
