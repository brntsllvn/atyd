FactoryGirl.define do
  factory :comic do
    sequence(:title) { |n| 'Awesome Comic #{n}' }
    release_date Date.new(1999, 12, 31)
    # carrierwave requires actual file (not just a string)
    # Detail: http://stackoverflow.com/questions/14227086/what-parameters-do-i-need-to-pass-in-the-controller-to-a-carrierwave-mounted-mod
    images [ Rack::Test::UploadedFile.new(Rails.root.join('spec', 'uploaders', 'awesome.png')),
             Rack::Test::UploadedFile.new(Rails.root.join('spec', 'uploaders', 'hotdog.jpg'))]

    factory :invalid_comic do
      images nil
    end

    factory :edited_comic do
      title 'Amazing Comic'
      release_date Date.new(1999, 01, 01)
    end
  end
end
