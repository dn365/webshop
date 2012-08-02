class MenuListsController < ApplicationController
  layout "admin"
  before_filter :system_protect
  # GET /menu_lists
  # GET /menu_lists.json
  def index
    @menu_lists = MenuList.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @menu_lists }
    end
  end

  # GET /menu_lists/1
  # GET /menu_lists/1.json
  def show
    @menu_list = MenuList.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @menu_list }
    end
  end

  # GET /menu_lists/new
  # GET /menu_lists/new.json
  def new
    @menu_list = MenuList.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @menu_list }
    end
  end

  # GET /menu_lists/1/edit
  def edit
    @menu_list = MenuList.find(params[:id])
  end

  # POST /menu_lists
  # POST /menu_lists.json
  def create
    @menu_list = MenuList.new(params[:menu_list])

    respond_to do |format|
      if @menu_list.save
        format.html { redirect_to @menu_list, notice: 'Menu list was successfully created.' }
        format.json { render json: @menu_list, status: :created, location: @menu_list }
      else
        format.html { render action: "new" }
        format.json { render json: @menu_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /menu_lists/1
  # PUT /menu_lists/1.json
  def update
    @menu_list = MenuList.find(params[:id])

    respond_to do |format|
      if @menu_list.update_attributes(params[:menu_list])
        format.html { redirect_to @menu_list, notice: 'Menu list was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @menu_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_lists/1
  # DELETE /menu_lists/1.json
  def destroy
    @menu_list = MenuList.find(params[:id])
    @menu_list.destroy

    respond_to do |format|
      format.html { redirect_to menu_lists_url }
      format.json { head :no_content }
    end
  end
end
