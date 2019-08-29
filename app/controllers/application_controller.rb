class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


    before_action :configure_permitted_parameters, if: :devise_controller?

# ログイン後に遷移するページ
def after_sign_in_path_for(resource)
  user_path(resource)
end

def after_sign_out_path_for(resouce)
  root_path(@book)
end

    
protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email])
    end

end
