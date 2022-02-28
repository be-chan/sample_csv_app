class CategoryArticle
  include ActiveModel::Model
    
  attr_accessor :name, :title, :body, :category_id

  def save
    category = Category.create(name: name)
    Article.create(title: title, body: body, category_id: category.id)
  end

  def search(search_name)
    Category.where("name LIKE ?", "%#{search_name}%")
  end
  
  def articles_category_search(search)
    # Category.eager_load(:articles).where(articles: {title: search})
    Category.eager_load(:articles).where("articles.title = ?", search)
  end
  
end