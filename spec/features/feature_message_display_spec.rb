require 'rails_helper'
RSpec.feature 'Message display', type: :feature do
  before(:each) do
    add_test_data_to_db
    visit('/')
    login_to_acebook
    visit('/posts')
    send_test_msg
  end
  scenario 'Messages are displayed in reverse chronologically' do

  end
  scenario 'User handle appears in message' do
    expect(page).to have_content('uwotm8')
    expect(page).to_not have_content('@hotmail.com') # uncomment when usernames added
  end
  scenario 'Send date appears in message' do
    expect(page).to have_content(': 2018') # will update properly
    expect(page).to_not have_content('UTC') # uncomment for neat dates
  end
end
