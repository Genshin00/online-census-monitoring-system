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
                :housing_risk_factor
 
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
    f.input :barangay
    # f.input :sitio, as: :datalist, collection: ["test", "another test"], input_html: {placeholder: "testing"}
    f.input :sitio
    f.input :house_no
    f.input :date_of_survey, as: :date_picker
    f.input :informant
    f.input :surveyed_by
    f.input :status
    br
    br
    f.inputs do
      f.input :house, as: :select, include_blank: false, collection: ["owned", "rented", "caretaker"]
      f.input :lot, as: :select, include_blank: false, collection: ["owned", "rented", "caretaker"]
      f.input :house_type, as: :select, include_blank: false, collection: ["Single", "Single, Duplex", "Two Storey", "Others"]
      f.input :material, as: :select, include_blank: false, collection: ["Concrete", "Wood", "Mixed", "Nipa", "Shanty"]
    end
    br
    br
    f.inputs  do
      f.input :electricity, as: :select, include_blank: false, collection: ["DECORP", "CENPELCO", "None"]
      f.input :telecommunication, as: :select, include_blank: false, collection: ["PLDT", "DIGITAL", "SMART", "GLOBE", "SUN", "OTHERS", "None"]
      f.input :toilet_facilities, as: :select, include_blank: false, collection: ["No", "Type", "WS", "AT", "OP", "None"]
      f.input :refuse_disposal, as: :select, include_blank: false, collection: ["Burning", "Dumping", "Burying", "Composting", "Animal Feeds", "Garbage Truck Collection"]
      f.input :fuel, as: :datalist, collection: ["LPG", "Wood", "Electric", "Charcoal"], input_html: {placeholder: "Specify if not available in the list"}
      f.input :water_supply, as: :select, include_blank: false, collection: ["Private deep well", "Public deep well", "Private shallow well", "Public shallow well", "Pressure pump (Jet Matic)", "Individual Connection (Water District)"]
      f.input :housing_risk_factor, as: :select, include_blank: false, collection: ["Along PNR", "Along riverbanks", "Along Highway", "Sqatters Area", "Flood Prone Area", "Others"]
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
        br
        
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
  end
end
