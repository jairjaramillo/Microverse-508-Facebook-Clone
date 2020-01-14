# frozen_string_literal: true

require 'rails_helper'

feature 'Multiple users like the same post and all of their names appear in the post page' do
  let(:user1) { create(:user, first_name: 'Dmitri', last_name: 'Karamazov') }
  let(:user2) { create(:user, first_name: 'Ivan', last_name: 'Karamazov') }
  let(:user3) { create(:user, first_name: 'Alexei', last_name: 'Karamazov') }
  let(:post) { create(:post) }

  scenario 'signed-in user likes their own post and other users posts, then dislikes own liked post' do
    login(user1)
    visit post_path(post)
    like(user1)
    click_link 'Log-off'

    login(user2)
    visit post_path(post)
    like(user2)
    click_link 'Log-off'

    login(user3)
    visit post_path(post)
    like(user3)

    liker_area = page.find_by_id('likers')

    expect(liker_area).to have_xpath('//div', text: 'Dmitri Karamazov')
    expect(liker_area).to have_xpath('//div', text: 'Ivan Karamazov')
    expect(liker_area).to have_xpath('//div', text: 'Alexei Karamazov')
  end
end
