class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
    current_user.follow(@User)
    redirect_to users_path @User
  end

  def destroy
    current_user.unfollow(@User)
    redirect_to users_path @User
  end

  private

  def find_user
    @User = User.find(params[:user_id])
  end
end
