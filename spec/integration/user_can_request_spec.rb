# frozen_string_literal: true

require 'rails_helper'

feature 'Send friend request' do
  let(:sender) { create(:user) }

  scenario 'signed-in user successfully request a friendship' do
    receiver = create(:user, first_name: 'Juan')
    login(sender)
    visit users_path

    expect(page).to have_content('Juan')
    expect do
      click_button 'Friend User'
    end.to change(Friendship, :count).by(1)

    expect(page).to have_content('Friend request sent!')
    expect(page).to have_content('Pending friend request')
    expect(page).to_not have_xpath('//button', text: 'Friend User')

    visit friends_path
    expect(page).to_not have_content('Juan')

    click_link 'Log-off'

    login(receiver)

    click_link 'Friends'
    expect(page).to_not have_content(sender.first_name)
    expect(page).to have_xpath('//a', text: 'Friend requests: 1')
    click_link 'Friend requests: 1'
    click_button 'Accept friendship'
    click_link 'Friends'
    expect(page).to have_content(sender.first_name)
  end
end
