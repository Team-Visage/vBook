feature 'User can sign up and see list of posts' do
  scenario 'User Login' do
    visit('/posts')
    click_link('New post')
    expect(page).to have_content('You need to sign in or sign up')
    login_to_acebook
    expect(page).to have_content('Welcome! You have signed up successfully.')
    fill_in 'Message',	with: 'a test post'
    click_button('Submit')
    expect(page).to have_content('New post')
    expect(page).to have_content('a test post')
  end
end
