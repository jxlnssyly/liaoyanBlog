class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def destory
  end

  private 
    def article_params
        params.require(:article).permit(:title,:content)
    end  
end
