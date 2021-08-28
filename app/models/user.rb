class User < ApplicationRecord
  include Filterable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follower_relationships
  has_many :followed_users, through: :follower_relationships, source: :followed_user
  has_many :following_relationships, foreign_key: 'followed_user_id', class_name: 'FollowerRelationship'
  has_many :following_users, through: :following_relationships, source: :user

  has_one_attached :avatar
  has_many_attached :photos

  scope :filter_by_sport, -> (sport) { where sport: sport }
  scope :filter_by_position, -> (position) { where position: position }
  scope :filter_by_gender, -> (gender) { where gender: gender }
  scope :filter_by_footedness, -> (footedness) { where footedness: footedness }
  scope :filter_by_height, -> (height) { where height: height }
  scope :filter_by_weight, -> (weight) { where weight: weight }

end
