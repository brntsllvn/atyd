require 'rails_helper'
require 'carrierwave/test/matchers'
require 'pry'

describe ComicUploader do
  include CarrierWave::Test::Matchers

  # Enable images processing before executing the examples.
  # Create a new uploader.
  before(:each) do
    ComicUploader.enable_processing = true
    @comic = Comic.new
    @uploader = VerticalImageUploader.new(@comic, :vertical_image)
    @uploader.store!(File.open(Rails.root.join('spec', 'uploaders', 'vert_img.jpg')))
  end

  # Disable images processing after executing the examples
  after(:each) do
    VerticalImageUploader.enable_processing = false
  end

  it "resizes the image" do
    expect(@uploader).to have_dimensions(284, 425)
  end
end   