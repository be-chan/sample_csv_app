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
  
  # CategoriesテーブルとArticlesテーブルの複数テーブル登録(フォームオブジェクト)
  def store
    @category_article = CategoryArticle.new(category_article_params)
    if @category_article.save
      p @category_article
      redirect_to categories_index_path
    else
      render categories_new_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_search_result_path
    else
      render categories_edit
    end
  end
  
  def search_result
    if params[:search_name].present?
      category_article = CategoryArticle.new
      @categories = category_article.search(params[:search_name])
    end
    if params[:articles_title].present?
      category_article = CategoryArticle.new
      @articles_category = category_article.articles_category_search(params[:articles_title])
    end
  end

  def select
    @categories = Category.select(:name).distinct
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
