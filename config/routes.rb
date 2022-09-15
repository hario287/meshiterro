Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/new'
  get 'homes/index'
  get 'homes/edit'
  get 'homes/show'
  root to: "homes#top"
end
