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
    @comment.destroy
    redirect_to root_path, notice: 'Comic was successfully destroyed.'
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :comic_id)
    end

end