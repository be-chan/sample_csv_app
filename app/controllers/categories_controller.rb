class CategoriesController < ApplicationController
  def index
    @category = Category.new
    
    p @articles
    if params[:category_search].present?
      category_search
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_index_path
    else
      render categories_index_path
    end
  end

  def new
    @category_article = CategoryArticle.new
  end

  def store
    @category_article = CategoryArticle.new(category_article_params)
    if @category_article.save
      p @category_article
      redirect_to categories_index_path
    else
      render categories_new_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category_search
    # @categories = Category.where("name LIKE ?", "%#{params[:category_search]}%")
    @articles = Article.joins(:category).where(categories: {id: params[:category_search]})
  end

  def category_article_params
    params.require(:category_article).permit(:name, :title, :body, :category_id)
  end
end
