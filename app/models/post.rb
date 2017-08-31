class Post < ApplicationRecord
  belongs_to :user
  has_attached_file :attachment, styles: {large:"600x600", medium: "300x300>" }
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/
end
