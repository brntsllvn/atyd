class Comic < ActiveRecord::Base
  validates :title,        presence: true
  validates :release_date, presence: true
  validates :images,       presence: true

  has_many :comments, dependent: :destroy

  mount_uploaders :images, ComicUploader
end
