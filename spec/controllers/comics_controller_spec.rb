require 'rails_helper'
require 'pry'

RSpec.describe ComicsController, type: :controller do

  describe "GET #index" do
    it "assigns all comics to @comics" do
      comic = create(:comic)
      get :index
      expect(assigns(:comics)).to eq [comic]
      expect(response).to render_template :index
    end
  end

  def create_mock_user
    user = double(:user)
    allow(controller).to(receive(:current_user).and_return(user))
    allow(controller.current_user).to receive(:is_admin?).and_return(false)
  end

  def create_mock_admin
    user = create(:user)
    allow(controller).to(receive(:current_user).and_return(user))
    allow(controller.current_user).to receive(:is_admin?).and_return(true)
  end

  describe "POST #vote" do
    it 'increments vote count' do
      create_mock_admin
      comic = create(:comic)
      params = { id: comic.id, format: 'js' }
      expect { post :vote, params }.to change(Vote, :count).by(1)
    end
    context 'user not logged in' do
      it 'does not increment' do
        comic = create(:comic)
        params = { id: comic.id, format: 'js' }
        expect { post :vote, params }.to change(Vote, :count).by(0)
      end
    end
    context 'user already voted' do
      it 'decrements' do
        create_mock_admin
        comic = create(:comic)
        vote = create(:vote, comic: comic, user: User.last)
        params = { id: comic.id, format: 'js' }
        expect { post :vote, params }.to change(Vote, :count).by(-1)
      end
    end
  end

  describe "GET #new" do
    context 'unauthorized user' do
      it 'redirects' do
        create_mock_user
        get :new
        expect(response).to redirect_to root_path
      end
    end
    context 'authorized user' do
      it "assigns a new comic as @comic" do
        create_mock_admin
        get :new
        expect(assigns(:comic)).to be_a_new(Comic)
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    context 'unauthorized user' do
      it 'redirects' do
        create_mock_user
        comic = create(:comic)
        get :edit, id: comic
        expect(response).to redirect_to root_path
      end
    end
    context 'authorized user' do
      it 'assigns the requested comic as @comic' do
        create_mock_admin
        comic = create(:comic)
        get :edit, id: comic
        expect(assigns(:comic)).to eq(comic)
        expect(response).to render_template :edit 
      end
    end

    describe "POST #create" do
      def post_comic(comic)
        post :create, comic: attributes_for(comic)
      end

      context 'unauthorized user' do
        it 'redirects' do
          create_mock_user
          comic = create(:comic)
          post_comic(:comic)
          expect(response).to redirect_to root_path
        end
      end

      context 'authorized user' do
        before :each do
          create_mock_admin
        end
      
        context "with valid params" do
          it "creates a new Comic" do
            expect { post_comic(:comic) }.to change(Comic, :count).by(1)
          end
          it "redirects" do
            post_comic(:comic)
            expect(response).to redirect_to root_path
          end
        end

        context "with invalid params" do
          it "does not create a new Comic" do
            expect { post_comic(:invalid_comic) }.to change(Comic, :count).by(0) 
          end
          it "assigns a newly created but unsaved comic as @comic" do
            post_comic(:invalid_comic)
            expect(assigns(:comic)).to be_a_new(Comic)
            expect(response).to render_template :new
          end
        end
      end
    end

    describe "PUT #update" do
      context 'unauthorized user' do
        it 'redirects' do
          create_mock_user
          comic = create(:comic)        
          put :update, { id: comic, comic: attributes_for(:edited_comic) }
          expect(response).to redirect_to root_path
        end
      end

      context 'authorized user' do
        context "with valid params" do
          before :each do
            create_mock_admin
            @comic = create(:comic)        
            put :update, { id: @comic, comic: attributes_for(:edited_comic) }
          end

          it "updates the requested comic" do
            @comic.reload
            expect(@comic.title).to eq 'New Comic Title'
            expect(@comic.release_date).to eq Date.new(1999, 01, 01)
            expect(assigns(:comic)).to eq @comic
            expect(response).to redirect_to root_path
          end
        end

        context "with invalid params" do
          before :each do
            create_mock_admin
            @comic = create(:comic)
            put :update, { id: @comic, comic: attributes_for(:invalid_comic) }
          end

          it "assigns the comic as @comic" do
            expect(assigns(:comic)).to eq @comic
            expect(response).to render_template :edit
          end
        end

        context 'record not found' do
          it 'raises' do      
            expect { put :update, { id: 42, comic: 'nada' } 
                   }.to raise_error(ActiveRecord::RecordNotFound)
            #TODO: redirect somewhere...
          end
        end
      end
    end

    describe "DELETE #destroy" do
      context 'unauthorized user' do
        it 'redirects' do
          create_mock_user
          comic = create(:comic)
          delete :destroy, { id: comic.id }
          expect(response).to redirect_to root_path
        end
      end

      context 'authorized user' do
        before :each do
          create_mock_admin
          @comic = create(:comic)
        end

        def destroy_comic(comic)
          delete :destroy, { id: comic.id }
        end

        it "destroys" do
          expect { destroy_comic(@comic) }.to change(Comic, :count).by(-1)
        end

        it "redirects" do
          expect(destroy_comic(@comic)).to redirect_to(comics_url)
        end
      end
    end
  end
end
