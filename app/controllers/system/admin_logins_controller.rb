 # encoding: utf-8
class System::AdminLoginsController < ApplicationController
  #layout "admin"
  before_filter :admin_login
  # GET /system/admin_logins
  # GET /system/admin_logins.json
  def index
    @system_admin_logins = System::AdminLogin.order(:name)

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
        format.html { redirect_to system_admin_logins_path, notice: 'Admin login was successfully created.' }
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
        format.html { redirect_to system_admin_logins_path, notice: 'Admin login was successfully updated.' }
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


end
