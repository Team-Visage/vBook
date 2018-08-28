require 'rails_helper'

RSpec.feature 'User handle shows in message', type: :feature do
  scenario 'user sends message, can see handle displayed in message' do
    visit('/posts/new')
    login_to_acebook
    send_test_msg
    expect(page).to have_content('') # write user handle code here
  end
end
