# frozen_string_literal: true

require 'rails_helper'

feature 'Visit ' do
  let(:user) { create(:user) }
  let(:post1) { create(:post, content: 'This is the first test comment with the minimum length.') }
  let(:post2) { create(:post, content: 'This is the second test comment with the minimum length.') }
  let(:post3) { create(:post, content: 'This is the third test comment with the minimum length.') }

  scenario 'signed-in user views posts at index page in descending creation order' do
    login(user)

    visit posts_path

    first = false
    second = false
    third = false

    # tests if posts show in descending order of creation
    page.text.split("\n").each do |s|
      if !first && !second && !third
        third = true if s.include? 'third'
      elsif !second && !first
        second = true if s.include? 'second'
      elsif !first
        first = true if s.include? 'first'
      end
    end

    expect(third && second && first).to be true
  end
end
