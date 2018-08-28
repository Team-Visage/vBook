feature 'User can sign up and see list of posts' do
    scenario 'User Login' do
      visit('/posts')
      click_link('New post')
      expect(page).to have_content('You need to sign in or sign up')
    end
  end
  