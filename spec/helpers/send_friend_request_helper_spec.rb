# frozen_string_literal: true

require 'rails_helper'

def send_request(name)
  visit users_path
  expect(page).to have_content(name)
  expect do
    click_button 'Friend User'
  end.to change(Friendship, :count).by(1)
end
