ActiveAdmin.register AdminUser do
  #filter :email
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :last_sign_in_ip
    column :sign_in_count
    default_actions
  end
  
  form do |f|
    f.inputs "Email Edit" do
      f.input :email
    end
    f.inputs "Password Conf" do
      f.input :password
      f.input :password_confirmation
    end
    f.buttons
  end
  
  
  #form :partial => "form_password"

  controller do
    
    def new
      @admin_user = AdminUser.new
      
    end
    
    def destroy
      @admin_user = AdminUser.find(params[:id])
      begin
        @admin_user.destroy
        flash[:notice] = "Admin user was successfully destroyed."
      rescue Exception => e
        flash[:notice] = e.message
      end
      redirect_to admin_admin_users_path
    end
  end

end
