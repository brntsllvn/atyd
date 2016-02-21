require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "#from_omniauth" do
    it 'works'
  end

  describe "#is_admin" do
    it 'false' do
      expect(create(:user).is_admin?).to be false
    end
    it 'true' do
      expect(create(:admin).is_admin?). to be true
    end
  end

end
