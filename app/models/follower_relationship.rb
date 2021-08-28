class FollowerRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :followed_user, class_name: 'User'
  belongs_to :chatroom
end
