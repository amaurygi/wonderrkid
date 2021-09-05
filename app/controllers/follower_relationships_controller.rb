class FollowerRelationshipsController < ApplicationController
 
  def index
  @connections = (User.find(params[:user_id]).followed_users + User.find(params[:user_id]).following_users).uniq
end

  def create
    @followed_user = User.find(params[:user_id])
    @follower_relationship = FollowerRelationship.new(user: current_user, followed_user: @followed_user)
    @chatroom = Chatroom.new(name: "#{current_user.first_name} - #{@followed_user.first_name}")
    @follower_relationship.chatroom = @chatroom
    if @follower_relationship.save
      redirect_to user_follower_relationships_path(current_user)
    else
      flash[:alert] = 'Sorry.'
    end
  end


end
