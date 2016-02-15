class Comic < ActiveRecord::Base
  validates :title,        presence: true
  validates :release_date, presence: true
  validates :pic,          presence: true

  mount_uploader :pic, ComicUploader
end
