require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "#is_admin" do
    it 'false' do
      expect(create(:user).is_admin?).to be false
    end
    it 'true' do
      expect(create(:admin).is_admin?).to be true
    end
  end
end
