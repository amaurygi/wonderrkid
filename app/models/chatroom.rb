class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :follower_relationships
end
