class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  def create
    if current_user
      @comment = current_user.comments.new(comment_params)

        if @comment.save
          redirect_to root_path, notice: 'Comment was successfully created.'
        else
          redirect_to root_path, alert: 'Invalid comment.'
        end

    else
      redirect_to root_path, notice: 'Log in to comment.'
    end
  end

  def destroy
    if current_user_is_owner_or_admin?
      @comment.destroy
      redirect_to root_path, notice: 'Comic was successfully destroyed.'
    else
      redirect_to root_path, notice: 'Unauthorized.' 
    end
  end


  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def current_user_is_owner_or_admin?
      if current_user
        @comment.user == current_user || current_user.try(:is_admin?)
      else
        false
      end
    end

    def comment_params
      params.require(:comment).permit(:body, :comic_id)
    end

end