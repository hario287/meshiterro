class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# パスワードの正確性を検証,ユーザ登録や編集、削除,
# ユーザ登録や編集、削除,ログイン情報を保存,email のフォーマットなどのバリデーション

has_many :post_images, dependent: :destroy
#1:N の「1」側にあたるモデルに、has_many を記載する必要がある
has_many :post_comments, dependent: :destroy

has_one_attached :profile_image
#ActiveStorageで、
#profile_imageという名前でプロフィール画像を保存できるよう設定した。

  def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
    #画像サイズの変換
  end

end
