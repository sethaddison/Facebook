class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_friendship
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likings, foreign_key: :liker_id
  has_many :liked_posts, through: :likings
  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: 'FriendRequest'
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: 'FriendRequest'

end
