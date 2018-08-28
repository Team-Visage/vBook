require 'rails_helper'

RSpec.feature 'User can logout', type: :feature do
  scenario 'User can login, then logout sucessfully' do
    visit('/')
    click_link 'Sign in'
    login_to_acebook
    visit('/')
    click_link 'Logout'
    expect(page).to have_content('Signed out successfully.')
  end
end
