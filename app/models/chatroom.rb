class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :follower_relationship


  scope :participating, ->(user) { joins(:follower_relationship).where(‘follower_relationships.user_id = ? OR follower_relationships.followed_user_id = ?’, user, user) }
  
end
