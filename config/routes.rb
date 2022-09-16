Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users

  resources :post_images, only: [:new, :index, :show]
  # get 'post_images/new'
  # get 'post_images/index'
  # get 'post_images/show'

  get "/homes/about" => "homes#about", as: "about"

end
