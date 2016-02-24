class Comic < ActiveRecord::Base
  validates :title,        presence: true
  validates :release_date, presence: true
  validates :images,       presence: true

  has_many :comments, dependent: :destroy

  mount_uploaders :images, ComicUploader

  def resize_image(vertical_or_horizontal)
    # horizontal_img = MiniMagick::Image.new(self.images[0].path)
    # aspect_ratio = horizontal_img.width.to_f / horizontal_img.height.to_f    

    # if vertical_or_horizontal == 'ho'
    #   return desired_width = 1000.to_f
    # elsif vertical_or_horizontal == 'vert'
    #   desired_width = 100.to_f
    # end

    # aspect_ratio_height = desired_width * aspect_ratio
    # return horizontal_img.resize "#{desired_width}x#{aspect_ratio_height}"

  end

  def resize_horizontal_image
    img = MiniMagick::Image.open(self.images[0].current_path)
    aspect_ratio = img.width.to_f / img.height.to_f 
  
    desired_width = 1000.to_f
    aspect_ratio_height = desired_width * aspect_ratio

    img.resize "#{desired_width}x#{aspect_ratio_height}"    
  end

  def resize_vertical_image
    img = MiniMagick::Image.open(self.images[1].current_path)
    aspect_ratio = img.width.to_f / img.height.to_f 
  
    desired_width = 100.to_f
    aspect_ratio_height = desired_width * aspect_ratio

    img.resize "#{desired_width}x#{aspect_ratio_height}"  
  end


end
