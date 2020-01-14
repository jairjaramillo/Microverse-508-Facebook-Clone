# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :commenter, class_name: 'User'

  validates :content, presence: true, length: { minimum: 20 }

  def self.all_latest
    all.order(created_at: :desc)
  end
end
