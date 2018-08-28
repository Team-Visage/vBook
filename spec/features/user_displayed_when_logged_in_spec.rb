require 'rails_helper'

RSpec.feature 'user login is displayed', type: :feature do
  scenario 'user name is visible on page' do
    visit('/')
    click_link('sign in')
    visit('posts')
    expect(page).to have_content('test user')
  end
end
