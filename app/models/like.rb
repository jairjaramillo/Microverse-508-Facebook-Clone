class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate :present_like?

  def present_like?
    if Like.find_by(post_id: self.post_id, user_id: self.user_id)
      errors.add(:repeate_relation, 'This user already liked this post')
    end
  end

  def self.liked?(post, user)
    Like.find_by(post_id: post.id, user_id: user.id)
  end
end
