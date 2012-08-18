# encoding: utf-8
ActiveAdmin.register Product do
  config.per_page = 25
  index :title => 'Product List' do
    column :title
    column :price, :sortable => :price do |product|
      div :class => "price" do
        number_to_currency product.price, :unit=> "¥ "
      end
    end
    column "Quantity", :dish_num
    column :image_url_file_name
    column :updated_at
    default_actions
  end
  
  show :title => proc{ product.title } do |product|
    attributes_table do
      row :title
      row :price
      row :dish_num
      row :description do
        div do
          simple_format product.description
        end
      end
      row :image_url do
        image_tag(product.image_url(:thumb)) 
      end
    end
    span link_to("Back", admin_products_path)
  end
  
  form do |f|
    f.inputs "Product" do
      f.input :title
      f.input :menu_list_id, :as => :select, :collection => MenuList.all.map{|x| [x.title, x.id]}, :prompt => "Select Menu"
      f.input :description, :as => :ckeditor, :input_html => { :height => 300, :width => "98%"}
      f.input :price
      f.input :dish_num, :input_html => { :value => "100"}
      f.input :image_url, :as => :file
    end
    f.buttons
  end

  #form :partial => "form"
  
end
