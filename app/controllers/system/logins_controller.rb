class System::LoginsController < ApplicationController
  # GET /system/logins
  # GET /system/logins.json
  def index
    @system_logins = System::Login.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @system_logins }
    end
  end

  # GET /system/logins/1
  # GET /system/logins/1.json
  def show
    @system_login = System::Login.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @system_login }
    end
  end

  # GET /system/logins/new
  # GET /system/logins/new.json
  def new
    @system_login = System::Login.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @system_login }
    end
  end

  # GET /system/logins/1/edit
  def edit
    @system_login = System::Login.find(params[:id])
  end

  # POST /system/logins
  # POST /system/logins.json
  def create
    @system_login = System::Login.new(params[:system_login])

    respond_to do |format|
      if @system_login.save
        format.html { redirect_to @system_login, notice: 'Login was successfully created.' }
        format.json { render json: @system_login, status: :created, location: @system_login }
      else
        format.html { render action: "new" }
        format.json { render json: @system_login.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /system/logins/1
  # PUT /system/logins/1.json
  def update
    @system_login = System::Login.find(params[:id])

    respond_to do |format|
      if @system_login.update_attributes(params[:system_login])
        format.html { redirect_to @system_login, notice: 'Login was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @system_login.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system/logins/1
  # DELETE /system/logins/1.json
  def destroy
    @system_login = System::Login.find(params[:id])
    @system_login.destroy

    respond_to do |format|
      format.html { redirect_to system_logins_url }
      format.json { head :no_content }
    end
  end
end
