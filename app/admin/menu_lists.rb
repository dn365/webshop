ActiveAdmin.register MenuList do
  index do
    column :title
    column :updated_at
    default_actions
  end
end