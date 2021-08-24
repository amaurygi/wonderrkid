class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      sql_query = "first_name ILIKE :query
        OR last_name ILIKE :query
        OR sport ILIKE :query
        OR position ILIKE :query
        OR description ILIKE :query"
      @users = User.where(sql_query, query: "%#{params[:query]}%")
    else
      @users = User.all
    end
  end

  def show

  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.id == current_user.id
      @user.update(user_params)
      @user.avatar.attach(user_params[:avatar]) if user_params[:avatar].present?
      redirect_to user_path(@user)
    else
      flash[:alert] = "You cannot edit other profiles!"
      render :action => :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name,:last_name,:sport,:position,:gender,:footedness,:weight,:height, :description, :avatar)
  end

end
