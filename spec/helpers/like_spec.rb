# frozen_string_literal: true

require 'rails_helper'

def like(user)
  expect do
    click_button 'Like'
  end.to change(Like, :count).by(1)

  expect(page).to have_content('Liked!')
  expect(page).to have_content("#{user.first_name} #{user.last_name}")
  expect(page).to_not have_xpath('//input', text: 'Dislike')
end
