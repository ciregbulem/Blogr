class CommentsController < ApplicationController
  before_action :authenticate_user!
  def new
  	@comment = Comment.new(comment_params)
  end

  def create
    @article = Article.find(params[:id])
    #@comment = @article.Comments.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
			@comment.save
			redirect_to @article
		else
			render 'new'
		end
  end
 
  private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end
end
end
