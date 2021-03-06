class FollowerRelationshipsController < ApplicationController
 
  def index
  @connections = Chatroom.participating(current_user)
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

  def destroy
    @follower_relationship = FollowerRelationship.find(params[:id])
    @follower_relationship.destroy
    redirect_to users_path
  end
end

