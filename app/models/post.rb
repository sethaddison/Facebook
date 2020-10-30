class Post < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  has_many :comments, dependent: :destroy
  has_many :likings, foreign_key: :liked_post_id, dependent: :destroy
  has_many :likers, through: :likings
end
