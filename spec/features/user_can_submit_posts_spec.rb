require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view them' do
    visit '/posts'
    login_to_acebook
    send_test_msg
    expect(page).to have_content('Hello, world!')
  end
end
