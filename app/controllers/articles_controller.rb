class ArticlesController < ApplicationController

  before_action :authenticate_user!
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
    if current_user.id == @article.author.id
      @article
    else
      head :forbidden
    end
  end

  def create
    @article = Article.new(article_params)
    @article.author = current_user
   
    if @article.save
        redirect_to @article
      else
        render 'new'
      end
  end

  def update
    @article = Article.find(params[:id])

    if current_user.id == @article.author.id
      if @article.update(article_params)
        redirect_to @article
      else
        render 'edit'
      end
    else
      head :forbidden
    end
  end
   
  def destroy
    @article = Article.find(params[:id])
    if current_user.id == @article.author.id
      @article.destroy
    else
      head :forbidden
    end
   
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text, :image)
    end
end
