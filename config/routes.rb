Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'posts/index'
  post 'posts/create'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/show'
  patch 'posts/update'
  put 'posts/update'
  delete 'posts/destroy'
  root 'posts#index'
  resources:posts
end


