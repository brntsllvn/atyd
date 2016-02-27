require 'rails_helper'
require 'carrierwave/test/matchers'
require 'pry'

describe HorizontalImageUploader do
  include CarrierWave::Test::Matchers

  # Enable images processing before executing the examples.
  # Create a new uploader.
  before(:each) do
    HorizontalImageUploader.enable_processing = true
    @comic = Comic.new
    @uploader = HorizontalImageUploader.new(@comic, :images)
    @uploader.store!(File.open(Rails.root.join('spec', 'uploaders', 'horo_img.jpg')))
  end

  # Disable images processing after executing the examples
  after(:each) do
    HorizontalImageUploader.enable_processing = false
  end

  it "resizes the image" do
    expect(@uploader).to have_dimensions(1000, 1496)
  end
end   