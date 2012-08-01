class SiteController < ApplicationController
  layout "site"
  before_filter :load_menu_lists

  def index

  end

  def list
    @menu = MenuList.find(params[:id])
    @product = @menu.products.paginate :page => params[:page], :order => "created_at DESC", :per_page => 15
  end

  def product
    @product = Product.find(params[:id])
  end

  def load_menu_lists
    @menu_lists = MenuList.all(:order => "created_at", :limit => 8)
  end


end
