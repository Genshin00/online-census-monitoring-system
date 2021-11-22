ActiveAdmin.register AdminUser, as: "Admins" do
  menu priority: 11
  permit_params :email, :name, :role, :status, :password, :password_confirmation, :image

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :role do |user|
      status_tag user.role
    end
    column :status do |user|
      status_tag user.status
    end 
    column :created_at
    actions
  end

  # filter :email
  # filter :role, as: :select
  # filter :status, as: :select

  form do |f|
    f.inputs do
      f.input :image, as: :file
      f.input :email
      f.input :name
      f.input :role
      f.input :status
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  show do 
    panel "User Information" do
      attributes_table_for resource do
        row :email
        row :role
        row :status
        row :created_at
      end
    end
  end

end
