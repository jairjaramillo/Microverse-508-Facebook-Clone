# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  has_many :users, through: :likes

  validates :content, presence: true, length: { minimum: 20 }

  def self.all_latest
    all.order(created_at: :desc)
  end
end
