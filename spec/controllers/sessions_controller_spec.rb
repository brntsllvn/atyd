require 'rails_helper'
require 'pry'

RSpec.describe SessionsController, type: :controller do

  before :each do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

  describe "#create" do
    it "creates a user" do
      expect { post :create, provider: :google }.to change{ User.count }.by(1)
    end
 
    it "creates a session" do
      expect(session[:user_id]).to be_nil
      post :create, provider: :google
      expect(session[:user_id]).to be_truthy
      expect(response).to redirect_to root_url
    end 
  end

  describe "#destroy" do
    it "destroys a session" do
      post :create, provider: :google
      expect(session[:user_id]).to be_truthy
      post :destroy
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the root" do
      post :destroy
      expect(response).to redirect_to root_url
    end
  end

end
