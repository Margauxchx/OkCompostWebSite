class ApplicationController < ActionController::Base
    include UsersHelper
    before_action :profile_enhencement
end
