class Book < ActiveRecord::Base

  belongs_to :user
  has_many :categories
  has_attached_file :cover, styles: { small: '150x150'}
  validates_attachment_content_type :cover, content_type: ["image/jpg", "image/jpeg", "image/png"]
end
