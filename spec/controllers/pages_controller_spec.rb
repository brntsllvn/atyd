require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  describe "GET #show" do
    it 'renders :about' do
      get :show, page: :about
      expect(response).to render_template :about
    end

    it 'renders :shop' do
      get :show, page: :shop
      expect(response).to render_template :shop
    end
  end
end
