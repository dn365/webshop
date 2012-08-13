class SiteController < ApplicationController
  layout "site"
  before_filter :load_menu_lists, :load_session_user

  def index
  end

  def list
    begin
      @menu = MenuList.find(params[:id])
      @product = @menu.products.paginate :page => params[:page], :order => "created_at DESC", :per_page => 15
    rescue ActiveRecord::RecordNotFound
      redirect_to site_url, :notice => "Not find this Page !"
    end

  end

  def product
    begin
      @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to site_url, :notice => "Not find this Page !"
    end
  end

  def load_menu_lists
      @menu_lists = MenuList.all(:order => "created_at", :limit => 8)
  end


end
