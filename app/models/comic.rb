class Comic < ActiveRecord::Base
  mount_uploader :pic, ComicUploader
end
