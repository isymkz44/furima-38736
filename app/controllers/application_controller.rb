class ApplicationController < ActionController::Base
  before_action :basic_auth, :configure_permitted_parameters, if: :devise_controller?  #もしdeviseに関するコントローラーの処理であれば、そのときだけconfigure_permitted_parametersメソッドを実行するように設定
 

  private   #Before_actionで記述するもの（特にApplicationController内に記述するもの）はストロングパタメーター、即ちprivate以下に記述することになる
    def basic_auth
        authenticate_or_request_with_http_basic do |username, password|
        username == 'admin' && password == '2222'
        end
    end 

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_reading, :last_name_reading, :nickname, :email, :birthday, :password])
    end
end
