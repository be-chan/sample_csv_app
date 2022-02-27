Rails.application.routes.draw do
  get 'posts/index'
  post 'posts/create' 

  get 'categories/index'
  post 'categories/create'
  get 'categories/search'

  get 'articles/index'
  post 'articles/create'
end
