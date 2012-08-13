 # encoding: utf-8
class System::AdminController < ApplicationController
  layout "admin", :except => "login"
  before_filter :system_protect, :except => "login"

  def index
  end

  def login
    if request.post? and params[:admin_login]
        @admin_login = System::AdminLogin.new(params[:admin_login])
        if admin_login = System::AdminLogin.new.authenticate(@admin_login.name, @admin_login.password)
          session[:admin_login_id] = admin_login.id
          flash[:notice] = "管理员 #{admin_login.name} 登录成功 ! "
          redirect_to(:action => "index", :controller => "system/admin")
        else
          @admin_login.password = nil
          flash[:notice] = "管理员帐户或密码错误，请重新输入 !"
        end
    end
  end

  def logout
    session[:admin_login_id] = nil
    flash[:notice] = "已经退出登录 !"
    redirect_to site_url
  end

end
