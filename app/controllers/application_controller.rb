class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user_info, :create_comment

  def get_user_info
    if current_user
      @User = User.find(current_user.id)
    end
  end

  def create_comment
    @comment = Comment.new
  end

end
