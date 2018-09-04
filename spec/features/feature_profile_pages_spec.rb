require 'rails_helper'

RSpec.feature 'Profile pages', type: :feature do

  before(:each) do
    add_test_data_to_db
    visit('/')
    login_to_acebook
  end

  scenario 'User can see own profile' do
    click_link('Profile')
    expect(page).to have_content(test_user[:username])
  end

  scenario 'User can see other user profile' do
    visit('/posts')
    click_link('jackIscool')
    expect(page).to have_content('a cool guy')
  end

end
