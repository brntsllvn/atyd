require 'rails_helper'
require 'pry'

RSpec.describe Comic, type: :model do

  describe '#resize_horizontal_image' do
    let(:comic) { create(:comic) }

    it 'resizes' do
      img = comic.resize_horizontal_image
      expect(img.width).to  be 1000
      expect(img.height).to be 1000
    end

    it 'resizes hotdog image' do
      comic.images[0] = comic.images[1] # facilitates testing second image
      img = comic.resize_horizontal_image
      expect(img.width).to  be 1000
      expect(img.height).to be_within(5).of(670)
    end
  end

  describe '#resizes_vertical_image' do
    let(:comic) { create(:comic) }

    it 'resizes hotdog image' do
      img = comic.resize_vertical_image
      expect(img.width).to  be 100
      expect(img.height).to be_within(1).of(67)
    end

  end
end
