class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follower_relationships, dependent: :destroy
  has_many :followed_users, through: :follower_relationships, source: :followed_user
  has_many :following_relationships, foreign_key: 'followed_user_id', class_name: 'FollowerRelationship'
  has_many :following_users, through: :following_relationships, source: :user
  has_many :messages

  has_one_attached :avatar
  has_many_attached :photos
  
end
