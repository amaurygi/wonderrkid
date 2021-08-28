class Chatroom < ApplicationRecord
  has_many :messages
  has_many :follower_relationships
end
