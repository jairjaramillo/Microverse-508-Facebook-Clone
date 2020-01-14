# frozen_string_literal: true

require 'rails_helper'

feature 'Create new post' do
  let(:user) { create(:user) }

  scenario 'signed-in user successfully creates a new comment in a post' do
    comment_content = 'This is a test comment with the minimum length.'
    login(user)
    create_post
    fill_in 'Content', with: comment_content

    expect do
      click_button 'send comment'
    end.to change(Comment, :count).by(1)

    expect(page).to have_content(comment_content)
  end

  scenario 'signed-in user creates a new comment without content gets error message' do
    comment_content = ''
    login(user)
    create_post
    fill_in 'Content', with: comment_content

    expect do
      click_button 'send comment'
    end.to change(Comment, :count).by(0)

    expect(page).to have_content('Error saving comment :-(')
  end
end
