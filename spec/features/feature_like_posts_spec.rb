require 'rails_helper'
RSpec.feature 'Liking Posts', type: :feature do
  before(:each) do
    add_test_data_to_db
    visit('/posts')
    login_to_acebook
    visit('/posts')
  end
  scenario 'User can like a post and see increase in likes' do
    expect(page).to have_content(0)
    expect(page).to_not have_content(1)
    click_button('Like')
    expect(page).to have_content(1)
    expect(page).to_not have_content(0)
  end
end