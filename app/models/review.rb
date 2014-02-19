class Review < ActiveRecord::Base
  validates :customer, :body, :car, presence: true

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :photo
end
