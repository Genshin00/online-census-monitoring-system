ActiveAdmin.register Barangay do

  permit_params :name, :status
  
  index do 
    selectable_column
    id_column
    column :name
    column :status do |item|
      status_tag item.status
    end
    column :created_at
    actions
  end

  show do
    panel "Barangay Details" do
      attributes_table_for resource do
        row :name
        row :status do 
          status_tag resource.status
        end
        row :created_at
        row :updated_at
      end
    end
  end
end
