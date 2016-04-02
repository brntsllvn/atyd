class Comic < ActiveRecord::Base
  validates :title,             presence: true
  validates :release_date,      presence: true
  validates :horizontal_image,  presence: true
  validates :vertical_image,    presence: true

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  mount_uploader :horizontal_image, HorizontalImageUploader
  mount_uploader :vertical_image, VerticalImageUploader

end
