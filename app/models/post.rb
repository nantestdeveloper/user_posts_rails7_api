class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable
  validates :title, presence: true
  validates :user_id, presence: true
end
