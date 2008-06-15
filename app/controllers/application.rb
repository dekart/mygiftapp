class ApplicationController < ActionController::Base
  helper :all 
  
  ensure_application_is_installed_by_facebook_user
end
