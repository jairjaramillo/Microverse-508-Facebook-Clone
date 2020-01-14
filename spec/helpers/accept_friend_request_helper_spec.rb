# frozen_string_literal: true

require 'rails_helper'

def accept_request(sender)
  click_link 'Friends'
  expect(page).to_not have_content(sender.first_name)
  expect(page).to have_xpath('//a', text: 'Friend requests: 1')
  click_link 'Friend requests: 1'
  click_button 'Accept friendship'
  expect do
    click_button 'Accept friendship'
  end.to change(friendship, :count).by(1)
  click_link 'Friends'
  expect(page).to have_content(sender.first_name)
  expect(page).to have_content('You are now mutual friends!')
end
