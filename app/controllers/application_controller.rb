class ApplicationController < ActionController::Base
before_action :authenticate_user!, except: [:top]
# ログイン認証が済んでいない状態で
# トップページ以外の画面にアクセスしても、
# ログイン画面へリダイレクトするようになります

before_action :configure_permitted_parameters, if: :devise_controller?
# devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
# configure_permitted_parametersメソッドが実行されます

  def after_sign_in_path_for(resource)
    post_images_path
  end
  def after_sign_out_path_for(resource)
    about_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # configure_permitted_parametersメソッドでは、
    # devise_parameter_sanitizer.permitメソッドを使うことで
    # ユーザー登録(sign_up)の際に、ユーザー名(name)のデータ操作を許可しています。
  end
end
