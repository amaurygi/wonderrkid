class FollowerRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: 'User'
  has_one :chatroom

  validates :user_id, uniqueness: { scope: :followed_user_id }
  validates :followed_user_id, uniqueness: { scope: :user_id }
end
