class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_attached_file :attachment, styles: {large:"600x600", medium: "300x300>" }
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
  self.per_page = 10
end
