class NewForeignKeys < ActiveRecord::Migration[6.0]
  def change
    remove_column(:follower_relationships, :chatroom_id)
    add_column :chatrooms, :follower_relationship_id, :integer, index: true
  end
end
