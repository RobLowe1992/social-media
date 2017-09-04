class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, styles: {large:"600x600", medium: "300x300>", thumb: "100x100", icon:"50x50" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  has_one :profile

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def feed
    following_ids = "SELECT followed_id FROM friendships WHERE follower_id = :user_id"
    Post.where("user_id IN (#{following_ids})", user_id: id).limit(10).order(created_at: :desc)
  end
end
