# frozen_string_literal: true

require 'rails_helper'

feature 'Create new post' do
  let(:user) { create(:user) }

  scenario 'signed-in user successfully creates a new post is redirected to the post page' do
    post_content = 'This is a test post with the minimum length.'
    login(user)
    visit new_post_path
    fill_in 'Content', with: post_content

    expect do
      click_button 'submit post'
    end.to change(Post, :count).by(1)

    expect(page).to have_content(post_content)
    expect(page).to have_css('#post_page')
  end

  scenario 'signed-in user submits a post without content should be redirected to posts and get an error flash' do
    post_content = 'Short post.'
    login(user)
    visit new_post_path
    fill_in 'Content', with: post_content

    expect do
      click_button 'submit post'
    end.to change(Post, :count).by(0)

    expect(page).to have_content('Content is too short (minimum is 20 characters)')
    expect(page).to have_no_content(post_content)

    expect(page).to have_css('#posts')
  end
end
