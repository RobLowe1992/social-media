class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to users_path user
  end

  def destroy
    user = Friendship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to users_path user
  end

  private

end
