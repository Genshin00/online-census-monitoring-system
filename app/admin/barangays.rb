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
    panel "Household List" do
      table_for resource.households do
        column :sitio
        column :house_no
        column :date_of_survey
        column :informant
        column :surveyed_by
        column :status do |item|
          status_tag item.status
        end
        column :action do |item|
          link_to "View details", admin_household_path(item)
        end
      end
    end
    panel "Reports" do
      div style: 'padding: 12px' do
        render 'admin/dashboard/report', households: resource.households
      end
    end
    # panel "Comments" do
    #   active_admin_comments
    # end
  end
end
