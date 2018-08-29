require 'rails_helper'
RSpec.feature 'User Logout', type: :feature do
  before(:each) { visit('/') }
  scenario 'Logged in user can logout' do
    add_test_data_to_db
    login_to_acebook
    logout_of_acebook
    expect(page).to have_content('Signed out successfully')
  end
  scenario 'cannot log out when not logged in' do
    expect(page).to_not have_content('Logout')
  end
end
  