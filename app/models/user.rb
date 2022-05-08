class User < ApplicationRecord
    has_many :comments, dependent: :destroy
    has_many :posts, dependent: :destroy
    # belongs_to :commentable, polymorphic: true
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
