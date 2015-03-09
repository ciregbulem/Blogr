class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @article = Article.find(params[:id])
    @comment = @article.comments.create(comment_params)
    @comment.user_id = current_user.id
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end
end
end
