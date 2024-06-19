ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :phone_number, :email_address, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email_address, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :full_name, :phone_number, :email_address, :notes, :image

  # Remove ActiveStorage filters
  remove_filter :image_attachment, :image_blob
  # filter :has_one_attached 

  # Columns to render in the dashboard
  index do
    selectable_column
    id_column
    column :full_name
    column :phone_number
    column :email_address
    column :notes
    column :created_at
    column :updated_at
    actions
  end

  # Form to create/edit a new customer
  form do |f|
    f.inputs 'Customer Details' do
      f.input :full_name
      f.input :phone_number
      f.input :email_address
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  # Details of the customers created
  show do
    attributes_table do
      row :full_name
      row :phone_number
      row :email_address
      row :notes
      row :created_at
      row :updated_at
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image)
        end
      end
    end
  end

  
end
