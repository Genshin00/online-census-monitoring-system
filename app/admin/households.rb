ActiveAdmin.register Household do

  permit_params :barangay_id, 
                :sitio, 
                :house_no, 
                :date_of_survey, 
                :informant, 
                :surveyed_by, 
                :status, 
                :house,
                :lot,
                :house_type,
                :material,
                :electricity,
                :telecommunication,
                :toilet_facilities,
                :refuse_disposal,
                :fuel,
                :water_supply,
                :housing_risk_factor,
                :business,
                :floor_area,
                :number_of_employees,
                vehicles_attributes: [:id, :household_id, :vehicle_type, :quantity, :_destroy, :_edit],
                household_people_attributes: [
                  :id,
                  :name,
                  :_destroy, 
                  :_edit
                ] 
 
  index do
    selectable_column
    id_column
    column :barangay
    column :sitio
    column :house_no
    column :date_of_survey
    column :informant
    column :surveyed_by
    column :status do |item|
      status_tag item.status
    end
    actions
  end
  
  form do |f|
    f.semantic_errors *f.object.errors.keys
    if params[:edit_type] != "household_person"
      f.object.barangay_id == current_admin_user.barangay_id if current_admin_user.bhw?
      f.input :barangay, as: current_admin_user.bhw? ? :hidden : :select
      # f.input :sitio, as: :datalist, collection: ["test", "another test"], input_html: {placeholder: "testing"}
      f.input :sitio
      f.input :house_no
      f.input :date_of_survey, as: :date_picker
      f.input :informant
      f.input :surveyed_by
      f.input :status

      f.inputs "Business" do
        f.input :business
        f.input :floor_area
        f.input :number_of_employees
      end
      br
      br
      f.inputs do
        f.input :house, as: :select, include_blank: false, collection: ["owned", "rented", "caretaker"]
        f.input :lot, as: :select, include_blank: false, collection: ["owned", "rented", "caretaker"]
        f.input :house_type, as: :select, include_blank: false, collection: ["Single", "Single, Duplex", "Two Storey Duplex", "Two Storey", "Others"]
        f.input :material, as: :select, include_blank: false, collection: ["Concrete", "Wood", "Mixed", "Nipa", "Shanty"]
      end

      f.inputs do
        f.has_many :vehicles,
        new_record: 'Add vehicle',
        remove_record: 'Remove vehicle',
        allow_destroy: true, 
        class: "" do |b|
          b.input :id, as: :hidden
          b.input :vehicle_type, as: :select, include_blank: false
          b.input :quantity
        end
      end

      br
      br
      f.inputs  do
        f.input :electricity, as: :select, include_blank: false, collection: ["DECORP", "CENPELCO", "None"]
        f.input :telecommunication, as: :select, include_blank: false, collection: ["PLDT", "DIGITEL", "SMART", "GLOBE", "SUN", "OTHERS", "None"]
        f.input :toilet_facilities, as: :select, include_blank: false, collection: ["Water Sealed", "Antipolo type", "Open Pit", "None"]
        f.input :refuse_disposal, as: :select, include_blank: false, collection: ["Burning", "Dumping", "Burying", "Composting", "Animal Feeds", "Garbage Truck Collection"]
        f.input :fuel, as: :datalist, collection: ["LPG", "Wood", "Electric", "Charcoal", "Others"], input_html: {placeholder: "Specify if not available in the list"}
        f.input :water_supply, as: :select, include_blank: false, collection: ["Private deep well", "Public deep well", "Private shallow well", "Public shallow well", "Pressure pump (Jet Matic)", "Individual Connection (Water District)"]
        f.input :housing_risk_factor, as: :select, include_blank: false, collection: ["Along PNR", "Along riverbanks", "Along Highway", "Squatter's  Area", "Flood Prone Area", "Others"]
      end
    else
      f.has_many :household_people,
      new_record: 'Add person',
      remove_record: 'Remove person',
      allow_destroy: true, 
      class: "" do |b|
        b.input :id, as: :hidden
        b.input :name
      end
    end
    f.actions
  end

  show do

    panel "Household Details" do 
      attributes_table_for resource do
        row :barangay
        row :sitio 
        row :house_no 
        row :date_of_survey 
        row :informant 
        row :surveyed_by 
        row :status 
      end
      a "Print household form", target: '_blank', href: "/reports/printable_household_form?id=#{resource.id}", class: 'btn btn-primary', style: 'margin: 20px 12px; display: inline-block'
    end

    panel "Household Members" do
      a "Add member", href: new_admin_household_person_path(household_id: resource.id), class: 'btn btn-primary', style: 'margin: 20px 12px; display: inline-block'
      table_for resource.household_people do
        column :id   
        column :no
        column :name
        column :age
        column :sex
        column :nationality
        column :civil_status
        column :migrated
        column :highest_education
        column :school_attended
        column :osy
        column :can_read
        column :employment
        column :employment_type
        column :type_of_work
        column :family_income
        column :dialect
        column :religion
        column :action do |item|
          a "Edit", href: edit_admin_household_person_path(item.id, household_id: resource.id)
        end
      end
    end

    panel "Business" do
      attributes_table_for resource do
        row :business
        row :floor_area
        row :number_of_employees
      end
    end

    panel "Vehicles" do
      table_for resource.vehicles do
        column :vehicle_type
        column :quantity
      end
    end

    
    panel "Housing" do
      attributes_table_for resource do
        row :house
        row :lot
        row :house_type
        row :material   
      end
    end

    panel "Other Information" do
      attributes_table_for resource do
        row :electricity
        row :telecommunication
        row :toilet_facilities
        row :refuse_disposal
        row :fuel
        row :water_supply
        row :housing_risk_factor
      end
    end

    # panel "Comments" do
    #   active_admin_comments
    # end
  end

  controller do
    def scoped_collection
      return end_of_association_chain.where(barangay_id: current_admin_user.barangay_id) if current_admin_user.bhw?
      return end_of_association_chain
    end
  end
end
