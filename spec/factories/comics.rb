FactoryGirl.define do
  factory :comic do
    title 'Original Comic Title'
    release_date Date.new(1999, 12, 31)
    # carrierwave requires actual file (not just a string)
    # Detail: http://stackoverflow.com/questions/14227086/what-parameters-do-i-need-to-pass-in-the-controller-to-a-carrierwave-mounted-mod
    horizontal_image Rack::Test::UploadedFile.new(Rails.root.join('spec', 'uploaders', 'horo_img.jpg'))
    vertical_image   Rack::Test::UploadedFile.new(Rails.root.join('spec', 'uploaders', 'vert_img.jpg'))

    factory :invalid_comic do
      horizontal_image nil
    end

    factory :edited_comic do
      title 'New Comic Title'
      release_date Date.new(1999, 01, 01)
    end
  end
end
