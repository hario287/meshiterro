class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
    #@post_imagesは、form_with に渡すため用意された「空のモデル」
  end

   # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end
    ##空のモデル(@post_images)では、PostImageモデルで定義したカラムを
    #"[モデル名].[カラム名]"という形で繋げることで、
    #保存するカラムの中身を操作することができます
    ##current_user は、コードに記述するだけで、
    #ログイン中のユーザーの情報を取得できる便利な記述です。
    #ヘルパーメソッドと呼ばれるものの一種で、
    #devise をインストールすることで使えるようになります。
      ##ログイン中のユーザーのidを取得することができるようになってる

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new

  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to "/post_images"
  end

   # 投稿データのストロングパラメータ
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
end
