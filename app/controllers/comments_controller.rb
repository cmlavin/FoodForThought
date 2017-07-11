class CommentsController < ApplicationController
  def edit
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @comment.story
  end

  def destroy
    @comment = Comment.find(params[:id])
    story = @comment.story
    @comment.destroy
    redirect_to story
  end

  private

  def comment_params
    params.require(:comment).permit(:reader_id, :content, :publish_date)
  end

end
