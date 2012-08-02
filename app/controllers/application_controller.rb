 # encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def system_protect
    unless session[:admin_login_id]
      flash[:notice] = "请先登录 !"
       redirect_to(admin_login_path)
       return false
    end
  end

end
