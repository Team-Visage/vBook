require 'rails_helper'

RSpec.feature 'visible message send time', type: :feature do
  scenario 'user sends a message, then sees send time displayed' do
    visit('/posts/new')
    login_to_acebook
    send_test_msg
    expect(page).to have_content('') # enter date here
  end
end
