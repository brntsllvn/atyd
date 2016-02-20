class Comic < ActiveRecord::Base
  validates :title,        presence: true
  validates :release_date, presence: true
  validates :images,       presence: true

  mount_uploaders :images, ComicUploader
end
