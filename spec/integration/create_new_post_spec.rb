# frozen_string_literal: true

require 'rails_helper'

feature 'Create new post' do
  let(:user) { create(:user) }

  scenario 'signed-in user successfully creates a new post is redirected to the post page' do
    post_content = 'This is a test comment with the minimum length.'
    login(user)
    visit new_post_path
    fill_in 'Content', with: post_content

    expect do
      click_button 'submit post'
    end.to change(Post, :count).by(1)

    expect(page).to have_content(post_content)
    expect(page).to have_css('#post_page')
  end

  scenario 'signed-in user submits a post without content should be redirected ' do
    post_content = 'This is a test comment with the minimum length.'
    login(user)
    visit new_post_path
    fill_in 'Content', with: post_content

    expect do
      click_button 'submit post'
    end.to change(Post, :count).by(1)

    expect(page).to have_content(post_content)
    expect(page).to have_css('#post_page')
  end
end
