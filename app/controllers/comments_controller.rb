class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @artilce = Article.find(params[:article_id])
    @comment = @artilce.comments.create(comment_params)
    redirect_to article_path(@artilce)
  end

  def destroy
    @artilce = Article.find(params[:comment_article])
    @comment = @artilce.comment.find(params[:comment])
    @comment.distroy
    redirect_to article_path(@artilce), status: :see_other
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
