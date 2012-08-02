class System::AdminController < ApplicationController
  layout "admin"
  before_filter :system_protect

  def index
  end
end
