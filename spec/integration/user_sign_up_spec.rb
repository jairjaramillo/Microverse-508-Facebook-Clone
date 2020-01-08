# frozen_string_literal: true

require 'rails_helper'

feature 'User signup' do
  let(:user) { build(:user) }

  scenario 'user sign up with valid data and the is logged in and redirected to posts index' do
    visit new_user_registration_path
    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
   
    expect do
      click_button 'Sign up'
    end.to change(User, :count).by(1)

    expect(page).to have_content('Log-off')

    expect(page).to have_css('#posts')
  end

end