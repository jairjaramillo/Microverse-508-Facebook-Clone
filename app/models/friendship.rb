# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validate :friendship_exists?, :no_self_love

  def friendship_exists?
    if Friendship.find_by('sender_id = ? AND receiver_id = ?',
                          sender_id, receiver_id)
      errors.add(:repeate_relation, 'Friendship relation already exists')
    end
  end

  def no_self_love
    errors.add(:repeate_relation, 'You can\'t friend your self silly') if sender_id == receiver_id
  end

  def self.between(user1, user2)
    Friendship.find_by('(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)',
                       user1.id, user2.id, user2.id, user1.id)
  end
end
