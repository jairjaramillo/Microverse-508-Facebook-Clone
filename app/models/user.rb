class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', class_name: 'Post', dependent: :destroy, inverse_of: :author

  validates :email, presence: true, length: { maximum: 150 }, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :image_link, presence: true
end
