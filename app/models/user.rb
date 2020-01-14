# frozen_string_literal: true

class User < ApplicationRecord
  before_create :process_mail
  before_save :add_gravatar
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  devise :omniauthable, omniauth_providers: %i[facebook]

  has_many :posts, foreign_key: 'author_id', class_name: 'Post', dependent: :destroy, inverse_of: :author
  has_many :comments, foreign_key: 'commenter_id', class_name: 'Comment', dependent: :destroy, inverse_of: :commenter
  has_many :likes
  has_many :liked_posts, through: :likes, foreign_key: 'post_id', source: :user

  has_many :initiated_friendships, foreign_key: 'sender_id', class_name: 'Friendship', source: :sender
  has_many :requested_friendships, foreign_key: 'receiver_id', class_name: 'Friendship', source: :receiver

  validates :first_name, presence: true
  validates :last_name, presence: true

  def friendships(status = true)
    (sent_requests(status) + received_requests(status)).uniq
  end

  def friends
    User.joins(:initiated_friendships)
      .where('status = ? AND (sender_id != ? AND receiver_id = ?)', true, id, id)
  end

  def received_requests(status = nil)
    requested_friendships.where('status IS ?', status)
  end

  def sent_requests(status = nil)
    initiated_friendships.where('status IS ?', status)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.name.split[0]
      user.last_name = auth.info.name.split[1..-1].join
      user.image_link = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  private

  def process_mail
    self.email = email.downcase
  end

  def add_gravatar
    gravatar_id = Digest::MD5.hexdigest(email)
    self.image_link = "http://secure.gravatar.com/avatar/#{gravatar_id}"
  end
end
