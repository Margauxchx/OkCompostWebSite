class ApplicationController < ActionController::Base
    include ApplicationHelper
    before_action :configure_devise_permitted_parameters, if: :devise_controller?

    protected

    def configure_devise_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password)}
    end
end
