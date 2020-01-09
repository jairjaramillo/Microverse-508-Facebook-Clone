# frozen_string_literal: true

require 'rails_helper'

feature 'User signoff' do
  let(:user) { create(:user) }

  scenario 'user sign in with valid data and is redirected to posts index' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Log-off'

    expect(page).to have_content('You need to sign in or sign up before continuing.')

    expect(page).to have_content('Log in')

    expect(page).to have_no_content('Log-off')
  end

  scenario 'signed-off user who tries to access to the new post page should be redirected to the sign-in page' do
    visit new_post_path

    expect(page).to have_content('You need to sign in or sign up before continuing.')

    expect(page).to have_content('Log in')
  end
end
