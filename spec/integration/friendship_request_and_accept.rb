# frozen_string_literal: true

require 'rails_helper'

feature 'Send friend request' do
  let(:sender) { create(:user) }
  let(:anti_social_user) { create(:user) }

  scenario 'signed-in user successfully request a friendship,
    friended user accepts it and can see posts from new friend' do
    login(anti_social_user)
    create_post 'This post will not show up to the other users'
    click_link 'Log-off'

    receiver = create(:user, first_name: 'Juan')
    login(sender)
    create_post 'Looking for friends post from sender user'

    send_request 'Juan'

    expect(page).to have_content('Friend request sent!')
    expect(page).to have_content('Pending friend request')
    expect(page).to_not have_xpath('//button', text: 'Friend User')

    visit friends_path
    expect(page).to_not have_content('Juan')

    click_link 'Log-off'

    login(receiver)
    create_post 'Accepting friends requests post from sender user'

    accept_request sender

    visit posts_path
    expect(page).to_not have_content('This post will not show up to the other users')
    expect(page).to have_content('Looking for friends post from sender user')
    expect(page).to have_content('Accepting friends requests post from sender user')
  end
end
