def test_login
  { email: 'atestemail@gmail.com',
    password: 'eu3838hjd32d3'
  }
end

def login_to_acebook
  click_link 'Sign up'
  fill_in 'user_email',	with: test_login[:email]
  fill_in 'user_password',	with: test_login[:password]
  fill_in 'user_password_confirmation',	with: test_login[:password]
  click_button 'Sign up'
end
