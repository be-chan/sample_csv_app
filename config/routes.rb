Rails.application.routes.draw do
  get 'posts/index'
  post 'posts/create' 

  get 'categories/index'
  post 'categories/create'
  get 'categories/new'
  post 'categories/store'
  get 'categories/:id/edit', to: 'categories#edit', as: 'categories_edit'
  put 'categories/update/:id', to: 'categories#update', as: 'categories_update'
  get 'categories/search_result'
  get 'categories/select'

  get 'articles/index'
  post 'articles/create'
end
