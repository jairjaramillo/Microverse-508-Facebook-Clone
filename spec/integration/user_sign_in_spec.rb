# frozen_string_literal: true

require 'rails_helper'

feature 'User signin' do
  let(:user) { create(:user) }

  scenario 'user sign in with valid data and is redirected to posts index' do
    login user

    expect(page).to have_content('Log-off')

    expect(page).to have_css('#posts')
  end

  scenario 'user with invalid email should get an error message' do
    visit new_user_session_path
    fill_in 'Email', with: 'non_existent@email.com'
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
    expect(page).to have_content('Log in')
  end

  scenario 'user with a wrong password should get an error message' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'wrong-password'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
    expect(page).to have_content('Log in')
  end
end
