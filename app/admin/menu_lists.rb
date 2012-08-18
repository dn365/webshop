ActiveAdmin.register MenuList do
  actions :all, :except => [:show]
  index do
    column :title
    column :updated_at
    default_actions
  end
end
