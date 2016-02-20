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

    context 'signed in user' do
      before :each do
        # stub the signed in user
        @user = create(:user)
        session[:user_id] = @user.id
      end

      it 'creates a comment' do
        expect { post_comment(:comment) }.to change(Comment, :count).by 1
     end

     it 'assigns comment to user' do
        expect { post_comment(:comment) }.to change { @user.comments.count }.by 1
     end

     it 'assigns comment to comic' do
       expect { post_comment(:comment) }.to change { @comic.comments.count }.by 1
     end

      it 'redirects to root' do
        expect(post_comment(:comment)).to redirect_to root_path
      end
    end

    context 'invalid comment' do

      it 'does not create a comment' do
        expect { post_comment(:invalid_comment) }.to change(Comment, :count).by 0
      end
      
      # todo: use Angular
      it 'tells the user what went wrong'
    end

    context 'not signed in user' do

      def not_signed_in_user_post_comment(comment) 
        post :create, comment: attributes_for(:comment)
      end

      it 'does not create a comment' do
        expect { not_signed_in_user_post_comment(:comment) }.to change(Comment, :count).by(0)
      end
      it 'prompts to sign on' do
        expect(not_signed_in_user_post_comment(:comment)).to redirect_to root_path
      end
    end
  end

  describe '#destroy' do
    before :each do
      @comment = create(:comment)
    end

    def destroy_comment(comment)
      delete :destroy, { id: comment.id }
    end

    it 'destroys' do
      expect { destroy_comment(@comment) }.to change(Comment, :count).by(-1)
    end

    it 'redirects' do
      expect(destroy_comment(@comment)).to redirect_to root_path
    end
  end
end
