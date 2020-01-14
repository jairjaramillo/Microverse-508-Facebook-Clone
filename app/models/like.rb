# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate :present_like?

  def present_like?
    errors.add(:repeate_relation, 'User already liked this post') if Like.find_by(post_id: post_id, user_id: user_id)
  end

  def self.liked?(post, user)
    Like.find_by(post_id: post.id, user_id: user.id)
  end
end
