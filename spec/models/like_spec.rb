# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:like) { build(:like) }
  let(:rlike) { create(:like) }
  let(:like_invalid_user) { build(:like, user_id: 1000) }
  let(:like_invalid_post) { build(:like, post_id: 1000) }

  context 'Test model presence and validation' do
    it 'Tests if model is valid' do
      expect(like).to be_valid
    end

    it 'Tests if like with invalid user_id is invalid' do
      expect(like_invalid_user).to_not be_valid
    end

    it 'Tests if like with invalid post_id is invalid' do
      expect(like_invalid_post).to_not be_valid
    end

    it 'Tests if repeated like is invalid' do
      repeated_like = build(:like, user_id: rlike.user_id, post_id: rlike.post_id)
      expect(repeated_like).to_not be_valid
    end
  end
end
