class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	#ログイン後に遷移するpathを設定
	def after_sign_in_path_for(resource)
		customer_path(resource)
	end

	protected　
	#sign_out後のredirect先
	def after_sign_out_path_for(resource)
		customer_path(resource)
	end
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
	end
end
