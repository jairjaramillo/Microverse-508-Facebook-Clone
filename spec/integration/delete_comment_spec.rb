# frozen_string_literal: true

require 'rails_helper'

feature 'Create new post' do
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  scenario 'signed-in user creates a comment and then deletes, the comment should be removed' do
    comment_to_delete = 'This is a test comment that is about to be deleted'
    login(user)
    create_post
    create_comment(comment_to_delete)

    expect(page).to have_content(comment_to_delete)

    accept_alert do
      click_link 'delete'
    end

    expect(page).to_not have_content(comment_to_delete)
    expect(page).to have_content('Comment successfully deleted')
  end
  scenario 'signed-in user can\'t see delete link for comments by other user' do
    comment_to_delete = 'This is a test comment that is about to be deleted'
    post = create(:post, content: comment_to_delete, author_id: user.id)

    login(user2)
    visit post_path(post)
    expect(page).to have_content(comment_to_delete)
    expect(page).to_not have_xpath('//a', text: 'delete')
  end
end
