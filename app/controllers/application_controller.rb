class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
      case resource
      when Owner
        owner_path(resource)
      when Admin
        admin_owners_path
      end
    end
  
    def after_sign_out_path_for(resource)
      root_path
    end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :prefecture])
  end
  
end
