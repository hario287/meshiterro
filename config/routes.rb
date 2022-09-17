Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get "/homes/about" => "homes#about", as: "about"

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    # ↑単数形にすると、/:idがURLに含まれなくなります
    # いいね機能の場合は、
    # 「1人のユーザーは1つの投稿に対して1回しかいいねできない」という仕様
    # ユーザーidと投稿(post_image)idが分かれば、
    # どのいいねを削除すればいいのかが特定できるということ
      # 説明はアプ完2-19章または検索ウ

    resources :post_comments, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update]
end