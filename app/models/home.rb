class Home < ApplicationRecord
  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE folower_id = :user_id"
    Post.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
end
