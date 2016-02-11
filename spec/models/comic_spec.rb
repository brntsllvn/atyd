require 'rails_helper'

RSpec.describe Comic, type: :model do

  describe ".not_broken?" do

    it "returns not nil" do
      comic = Comic.new
      result = comic.not_broken?
      expect(result).to be_truthy
    end

  end

end
