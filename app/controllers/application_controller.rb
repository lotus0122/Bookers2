class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


    before_action :configure_permitted_parameters, if: :devise_controller?

# ログイン後移動ページ
def after_sign_in_path_for(resource)
  flash[:success] = "Signed in successfully."
  user_path(resource)
end

# ログアウト後移動ページ
def after_sign_out_path_for(resouce)
  flash[:success] = "Signed out successfully."
  root_path(@book)
end

    
protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    end

end
