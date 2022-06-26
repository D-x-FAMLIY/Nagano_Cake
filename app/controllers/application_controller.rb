class ApplicationController < ActionController::Base


  def after_admin_sign_in_path_for(resource)
    admin_root_path
  end

  def after_admin_sign_out_path_for(resource)
    new_admin_sessions_path
  end

  def after_public_sign_in_path_for(resource)
    public_root_path
  end

  def after_public_sign_up_path_for(resource)
    public_show_path
  end

  def after_public_sign_out_path_for(resource)
    about_path
  end

end