class ApplicationController < ActionController::Base

  def after_admin_sign_in_path_for(resource)
    
  end
  
  def after_public_sign_in_path_for(resource)
    root_path
  end
  
  def after_public_sign_up_path_for(resource)
    
  end
  
  def after_public_sign_out_path_for(resource)
    about_path
  end
  
end

