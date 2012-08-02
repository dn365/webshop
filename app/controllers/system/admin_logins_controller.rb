 # encoding: utf-8
class System::AdminLoginsController < ApplicationController
  layout "admin", :except => "system_login"
  before_filter :system_protect, :except => "system_login"
  # GET /system/admin_logins
  # GET /system/admin_logins.json
  def index
    @system_admin_logins = System::AdminLogin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @system_admin_logins }
    end
  end

  # GET /system/admin_logins/1
  # GET /system/admin_logins/1.json
  def show
    @system_admin_login = System::AdminLogin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system_admin_login }
    end
  end

  # GET /system/admin_logins/new
  # GET /system/admin_logins/new.json
  def new
    @system_admin_login = System::AdminLogin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system_admin_login }
    end
  end

  # GET /system/admin_logins/1/edit
  def edit
    @system_admin_login = System::AdminLogin.find(params[:id])
  end

  # POST /system/admin_logins
  # POST /system/admin_logins.json
  def create
    @system_admin_login = System::AdminLogin.new(params[:system_admin_login])

    respond_to do |format|
      if @system_admin_login.save
        session[:admin_login_id] = @system_admin_login.id
        format.html { redirect_to @system_admin_login, notice: 'Admin login was successfully created.' }
        format.json { render json: @system_admin_login, status: :created, location: @system_admin_login }
      else
        format.html { render action: "new" }
        format.json { render json: @system_admin_login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /system/admin_logins/1
  # PUT /system/admin_logins/1.json
  def update
    @system_admin_login = System::AdminLogin.find(params[:id])

    respond_to do |format|
      if @system_admin_login.update_attributes(params[:system_admin_login])
        format.html { redirect_to @system_admin_login, notice: 'Admin login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @system_admin_login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system/admin_logins/1
  # DELETE /system/admin_logins/1.json
  def destroy
    @system_admin_login = System::AdminLogin.find(params[:id])
    @system_admin_login.destroy

    respond_to do |format|
      format.html { redirect_to system_admin_logins_url }
      format.json { head :no_content }
    end
  end

  def system_login
    if request.post? and params[:admin_login]
      @admin_login = System::AdminLogin.new(params[:admin_login])
      admin_login = System::AdminLogin.find_by_name_and_password(@admin_login.name,@admin_login.password)
      if admin_login
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
      redirect_to(:action => "index", :controller => "/site")
  end


end
