require 'rails_helper'
RSpec.feature 'User login', type: :feature do
  before(:each) { visit('/') }
  scenario 'user can create an accout test tim and ed' do
    #  sign_up_to_acebook
    click_link('Sign up')
    fill_in('user_email',	with: 'UWotM8@hotmail.com')
    fill_in('user_username',	with: 'UWotM8')
    fill_in('user_password',	with: '1234567')
    fill_in('user_password_confirmation',	with: '1234567')
    click_button('Sign up')
    save_and_open_page
    expect(page).to have_content('A message with a confirmation link has been sent to your email address')
  end
  scenario 'user can login to exisiting account' do
    add_test_data_to_db
    login_to_acebook
    expect(page).to have_content('Signed in successfully')
  end
end
