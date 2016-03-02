require 'rails_helper'
require 'pry'

RSpec.describe CommentsController, type: :controller do

  describe '#create' do
    before :each do
      @comic = create(:comic)
    end

    def post_comment(comment)
      post :create, user_id: @user, 
                    comment: attributes_for(:comment, comic_id: @comic) 
    end

    context 'authorized user' do
      before :each do
        @user = create(:user)
        session[:user_id] = @user.id
      end

      it 'creates a comment' do
        expect { post_comment(:comment) }.to change(Comment, :count).by 1
        expect(response).to redirect_to root_path
     end

     it 'assigns comment to user' do
        expect { post_comment(:comment) }.to change { @user.comments.count }.by 1
     end

     it 'assigns comment to comic' do
       expect { post_comment(:comment) }.to change { @comic.comments.count }.by 1
     end
    end

    context 'invalid comment' do
      it 'does not create a comment' do
        expect { post_comment(:invalid_comment) }.to change(Comment, :count).by 0
      end
    end

    context 'unauthorized user' do

      def not_signed_in_user_post_comment(comment) 
        post :create, comment: attributes_for(:comment)
      end

      it 'does not create a comment' do
        expect { not_signed_in_user_post_comment(:comment) }.to change(Comment, :count).by 0
        expect(response).to redirect_to root_path
      end
    end
  end

  describe '#destroy' do
    def destroy_comment(comment)
      delete :destroy, { id: comment.id }
    end

    context 'authorized user: owner or admin' do
      it 'destroys' do
        @user = create(:user)
        session[:user_id] = @user.id
        @comment = @user.comments.create(attributes_for(:comment))
        expect { destroy_comment(@comment) }.to change(Comment, :count).by -1
        expect(response).to redirect_to root_path          
      end
    end

    context 'unauthorized user' do 
      it 'does not destroy - user not signed in' do
        @comment = create(:comment)
        expect { destroy_comment(@comment) }.to change(Comment, :count).by 0
        expect(response).to redirect_to root_path 
      end
      it 'does not destroy - user not owner' do
        @user = create(:user)
        session[:user_id] = @user.id 
        @comment = create(:comment)
        expect { destroy_comment(@comment) }.to change(Comment, :count).by 0
        expect(response).to redirect_to root_path      
      end
    end
  end
end
