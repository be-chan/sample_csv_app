Rails.application.routes.draw do
  get 'api_requests/connection'
  get 'posts/index'
  post 'posts/create' 

  get 'categories/index'
  post 'categories/create'
  get 'categories/new'
  post 'categories/store'
  get 'categories/:id/edit', to: 'categories#edit', as: 'categories_edit'
  put 'categories/update/:id', to: 'categories#update', as: 'categories_update'
  put 'categories/update_form/:id', to: 'categories#update_form', as: 'categories_update_form'
  get 'categories/search_result'
  get 'categories/select'


  get 'articles/index'
  post 'articles/create'
  
  get 'api/request', to: 'api_requests#connection'
end
