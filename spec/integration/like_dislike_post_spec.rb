# frozen_string_literal: true

require 'rails_helper'

feature 'Like and dislike liked post' do
  let(:user1) { create(:user) }
  let(:user2) { create(:user) }

  scenario 'signed-in user likes their own post and other users posts, then dislikes own liked post' do
    my_post = create(:post, author_id: user1.id, content: 'This is my own post, just mine but y\'all
      can like it if you want')
    their_post = create(:post, author_id: user2.id, content: 'This is not my own post, not mine but
      Imma going to like it anyway')

    login(user1)

    visit post_path(my_post)
    expect(page).to have_content('0 users liked this post!')
    like(user1)
    expect(page).to have_content('1 users liked this post!')

    visit post_path(their_post)
    expect(page).to have_content('0 users liked this post!')
    like(user1)
    expect(page).to have_content('1 users liked this post!')

    visit posts_path

    expect(page).to_not have_xpath('//input', text: 'Dislike', count: 2)

    visit post_path(my_post)
    dislike(user1)
  end
end
