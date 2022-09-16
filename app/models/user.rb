class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# パスワードの正確性を検証,ユーザ登録や編集、削除,
# ユーザ登録や編集、削除,ログイン情報を保存,email のフォーマットなどのバリデーション

has_many :post_images, dependent: :destroy
#1:N の「1」側にあたるモデルに、has_many を記載する必要がある
end
