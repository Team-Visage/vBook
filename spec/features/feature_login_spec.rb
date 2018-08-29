require 'rails_helper'
RSpec.feature 'User login', type: :feature do
  before(:each) { visit('/') }
  scenario 'user can create an account' do
    click_link 'Sign in'
    sign_up_to_acebook
    expect(page).to have_content('A message with a confirmation link has been sent to your email address')
  end
  scenario 'user can login to exisiting account' do
    add_test_data_to_db
    login_to_acebook
    expect(page).to have_content('Signed in successfully')
  end
end
