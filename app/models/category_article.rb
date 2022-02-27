class CategoryArticle
  include ActiveModel::Model
    
  attr_accessor :name, :title, :body, :category_id

  def save
    category = Category.create(name: name)
    Article.create(title: title, body: body, category_id: category.id)
  end
end