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

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category_search
    # @categories = Category.where("name LIKE ?", "%#{params[:category_search]}%")
    @articles = Article.joins(:category).where(categories: {id: params[:category_search]})
  end
end
