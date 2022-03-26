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

  get 'reserves/new' # 入力画面
  post 'reserves/confirm' # 確認画面
  post 'reserves/back' # 確認画面から「入力画面に戻る」をクリックしたとき
  post 'reserves/complete' # 完了画面
  
  get 'reserves/:id/edit', to: 'reserves#edit' , as: 'reserves_edit'
  post 'reserves/:id/edit_confirm', to: 'reserves#edit_confirm' , as: 'reserves_edit_confirm'
  put 'reserves/update/:id', to: 'reserves#update' , as: 'reserves_update'
  
  resources 'blogs' do
    collection do
      post 'confirm'
    end
    member do
      patch 'edit_confirm'
    end
  end


end
