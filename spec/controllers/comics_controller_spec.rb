require 'rails_helper'

RSpec.describe ComicsController, type: :controller do

  describe "GET #index" do
    before :each do
      @comic = create(:comic)
      get :index
    end

    it "assigns all comics to @comics" do
      expect(assigns(:comics)).to eq [@comic]
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before :each do
      @comic = create(:comic)
      get :show, id: @comic
    end

    it "assigns the requested comic as @comic" do
      expect(assigns(:comic)).to eq(@comic)
    end

    it "renders the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before :each do
      get :new
    end

    it "assigns a new comic as @comic" do
      expect(assigns(:comic)).to be_a_new(Comic)
    end

    it "renders the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    before :each do
      @comic = create(:comic)
      get :edit, id: @comic
    end

    it "assigns the requested comic as @comic" do
      expect(assigns(:comic)).to eq(@comic)
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit     
    end
  end

  describe "POST #create" do

    def post_comic(comic)
      post :create, comic: attributes_for(comic)
    end

    before :each do
      ActionMailer::Base.deliveries = []
    end

    context "with valid params" do
      it "creates a new Comic" do
        expect { post_comic(:comic) }.to change(Comic, :count).by(1)
      end

      it "assigns a newly created comic as @comic" do
        post_comic(:comic)
        expect(assigns(:comic)).to be_a(Comic)
      end

      it "queues the comic for email delivery" do
        post_comic(:comic)
        expect(ActionMailer::Base.deliveries.count).to eq 1
      end

      it "redirects to the created comic" do
        post_comic(:comic)
        expect(response).to redirect_to(Comic.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Comic" do
        expect { post_comic(:invalid_comic) }.to change(Comic, :count).by(0) 
      end

      it "assigns a newly created but unsaved comic as @comic" do
        post_comic(:invalid_comic)
        expect(assigns(:comic)).to be_a_new(Comic)
      end

      it "re-renders the :new template" do
        post_comic(:invalid_comic)
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      before :each do
        @comic = create(:comic)        
        put :update, { id: @comic, comic: attributes_for(:edited_comic) }
      end

      it "updates the requested comic" do
        @comic.reload
        expect(@comic.title).to eq 'Amazing Comic'
        expect(@comic.release_date).to eq Date.new(1999, 01, 01)
      end

      it "assigns the requested comic as @comic" do
        expect(assigns(:comic)).to eq @comic
      end

      it "redirects to the comic" do
        expect(response).to redirect_to @comic
      end
    end

    context "with invalid params" do
      before :each do
        @comic = create(:comic)
        put :update, { id: @comic, comic: attributes_for(:invalid_comic) }
      end

      it "assigns the comic as @comic" do
        expect(assigns(:comic)).to eq @comic
      end

      it "re-renders the :edit template" do
        expect(response).to redirect_to @comic
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @comic = create(:comic)
    end

    def destroy_comic(comic)
      delete :destroy, { id: @comic }
    end

    it "destroys the requested comic" do
      expect { destroy_comic(@comic) }.to change(Comic, :count).by(-1)
    end

    it "redirects to the comics list" do
      destroy_comic(@comic)
      expect(response).to redirect_to(comics_url)
    end
  end

end
