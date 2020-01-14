# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:friendship) { create(:friendship) }
  let(:same_id) { build(:friendship, sender_id: 1, receiver_id: 1) }
  let(:no_repeat) { build(:friendship, sender_id: friendship.receiver_id, receiver_id: friendship.sender_id) }
  let(:no_friend) { build(:user) }

  context 'Test model presence and validation' do
    it 'Tests if model is valid' do
      expect(friendship).to be_valid
    end

    it 'Tests if friendship with the same receiver and sender id is invalid' do
      expect(same_id).to_not be_valid
    end

    it 'Tests if a repeated friendship is invalid' do
      expect(no_repeat).to_not be_valid
    end

    it 'Tests friendship.betweeen' do
      expect(Friendship.between(friendship.sender, friendship.receiver)).to be_truthy
    end

    it 'Tests friendship.betweeen' do
      expect(Friendship.between(friendship.sender, no_friend)).to be_falsy
    end
  end
end
