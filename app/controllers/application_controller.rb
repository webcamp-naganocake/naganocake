class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      case resource
        when Admin
          admins_root_path
        when Customer
          root_path
  		end
	  end

    def after_sign_in_out_for(resource)
      case resource
        when Admin
          new_admin_session_path
        when Customer
          root_path
      end
    end

    # def after_sign_out_path_for(resource)
    #   if resource == :admin
    #     new_admin_session_path
    #   elsif resource == :customer
    #     root_path
    #   else
    #     root_path
    #   end
    # end

    # def after_sign_out_path_for(resource)
    #   if resource == :admin
    #     admin_homes_top_path
    #   elsif resource == :customer
    #     homes_top_path
    #   else
    #     homes_top_path
    #   end
    # end


    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :encrypted_password, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number])
    end
end
