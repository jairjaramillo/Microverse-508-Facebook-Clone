# frozen_string_literal: true

class User < ApplicationRecord
  before_create :process_mail
  before_save :add_gravatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', class_name: 'Post', dependent: :destroy, inverse_of: :author
  has_many :comments, foreign_key: 'commenter_id', class_name: 'Comment', dependent: :destroy, inverse_of: :commenter
  has_many :likes
  has_many :liked_posts, through: :likes, foreign_key: 'post_id', source: :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def process_mail
    self.email = email.downcase
  end

  def add_gravatar
    gravatar_id = Digest::MD5.hexdigest(email)
    self.image_link = "http://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
