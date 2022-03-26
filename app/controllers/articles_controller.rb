class ArticlesController < ApplicationController
  def index
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_index_path
    else
      render articles_index_path
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end
end
