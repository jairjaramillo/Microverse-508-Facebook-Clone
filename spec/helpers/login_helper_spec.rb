# frozen_string_literal: true

require 'rails_helper'

def login(user)
  visit new_user_session_path
  expect(page).to have_content('Sign in with Facebook')
  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password
  click_button 'Log in'
end
