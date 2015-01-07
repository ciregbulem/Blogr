class ArticlesController < ApplicationController
	before_action :authenticate_user!, :except => [:index, :show]
	def new
		@article = Article.new
	end
	
	def create
		@article = Article.new(article_params)
		@article.user_id = current_user.id
		if @article.save
			@article.save
			redirect_to @article
		else
			render 'new'
		end
	end
	
	def show
		@article = Article.find(params[:id])
	end
	
	def index
  		@articles = Article.paginate(:page => params[:page], :per_page => 4)
  		@articles = @articles.reverse_order
	end
	
	def edit
		if current_user.id == Article.find(params[:id]).user_id
			@article = Article.find(params[:id])
		else
			flash[:alert] = 'Cannot edit articles you did not create. Only Admins have that access'
			redirect_to root_path
		end
	end
	
	def update
		@article = Article.find(params[:id])
		
		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
	       
		redirect_to articles_path
	end
		      
	private
		def article_params
			params.require(:article).permit(:title, :text)
		end	
end
