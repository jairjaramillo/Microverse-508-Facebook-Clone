# frozen_string_literal: true

require 'rails_helper'

def dislike(_user)
  expect(page).to have_content('1 users liked this post!')

  expect do
    click_button 'Dislike'
  end.to change(Like, :count).by(-1)

  expect(page).to have_content('0 users liked this post!')

  expect(page).to have_content('Disliked...')
  expect(page).to_not have_xpath('//input', text: 'Like')
end
