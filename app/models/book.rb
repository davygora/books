class Book < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :categories
  has_attached_file :cover, styles: { small: '150x150'}
  validates_attachment_content_type :cover, content_type: ["image/jpg", "image/jpeg", "image/png"]

  scope :last_week, -> { where("created_at >= ?", 7.days.ago.beginning_of_day) }
  scope :drafts, -> { where(draft: true) }
  scope :not_drafts, -> { where(draft: :false) }

  def owner?(other_user)
    user == other_user
  end
end
