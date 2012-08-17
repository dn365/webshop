 # encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery


  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  def admin_login
    unless session[:admin_user_id]
      flash[:notice] = "Please login first"
      redirect_to admin_dashboard_path
      return false
    end
  end


  def system_protect
    unless session[:admin_login_id]
      flash[:notice] = "请先登录 !"
       redirect_to(admin_login_path)
       return false
    end
  end

  def load_session_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

end
