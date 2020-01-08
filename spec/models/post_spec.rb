# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }
  let(:post_no_content) { build(:post, content: '') }
  let(:post_small_content) { build(:post, content: '< 20') }
  let(:post_invalid_author) { build(:post, author_id: 1000) }

  context 'Test model presence and validation' do
    it 'Tests if model is valid' do
      expect(post).to be_valid
    end

    it 'Tests if post without content is invalid' do
      expect(post_no_content).to_not be_valid
    end

    it 'Tests if post with content shorter than 20 characters is invalid' do
      expect(post_small_content).to_not be_valid
    end

    it 'Tests if post with invalid author_id is invalid' do
      expect(post_invalid_author).to_not be_valid
    end
  end
end
