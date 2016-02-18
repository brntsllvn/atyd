require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    before :each do
      @user = create(:user)
      get :index
    end

    it "assigns all users to @users" do
      expect(assigns(:users)).to eq [@user]
    end
  
    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end
end