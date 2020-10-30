class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def request_friendship
    requested_user = User.find_by_id(params[:id])
    current_user.friend_request(requested_user)
    redirect_to users_path, notice: "Your friend request was sent to #{requested_user.name}"
  end

  def accept_friendship
    requesting_user = User.find_by_id(params[:id])
    current_user.accept_request(requesting_user)
    redirect_to users_path, notice: "You and #{requesting_user.name} are now friends"
  end

  def decline_fiendship
    requesting_user = User.find_by_id(params[:id])
    current_user.decline_request(requesting_user)
    redirect_to users_path, notice: "You ignored the request from #{requesting_user.name}"
  end

  def remove_friendship
    other_user = User.find_by_id(params[:id])
    current_user.remove_friend(other_user)
    redirect_to users_path, notice: "You and #{other_user.name} are no longer friends"
  end

  def others
    User.where_not(current_user)
  end

end
