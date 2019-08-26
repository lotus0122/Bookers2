class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end



# ログイン後に遷移するページ
def after_sign_in_path_for(resource)
    books_path(resource)
end
# 変更
def set_current_user
  @current_user = User.find_by(id: session[:user_id])
end



end
