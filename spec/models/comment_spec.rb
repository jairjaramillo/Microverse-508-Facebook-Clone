# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { create(:comment) }
  let(:comment_no_content) { build(:comment, content: '') }
  let(:comment_small_content) { build(:comment, content: '< 20') }
  let(:comment_invalid_author) { build(:comment, commenter_id: 1000) }
  let(:comment_invalid_post) { build(:comment, post_id: 1000) }

  context 'Test model presence and validation' do
    it 'Tests if model is valid' do
      expect(comment).to be_valid
    end

    it 'Tests if comment without content is invalid' do
      expect(comment_no_content).to_not be_valid
    end

    it 'Tests if comment with content shorter than 20 characters is invalid' do
      expect(comment_small_content).to_not be_valid
    end

    it 'Tests if comment with invalid commenter_id is invalid' do
      expect(comment_invalid_author).to_not be_valid
    end

    it 'Tests if comment with invalid post_id is invalid' do
      expect(comment_invalid_author).to_not be_valid
    end
  end
end
