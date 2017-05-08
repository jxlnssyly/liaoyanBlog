class ArticlesController < ApplicationController
  def index
  end

  def show
  end

  def create
    render plain: params.inspect
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def destory
  end
end
