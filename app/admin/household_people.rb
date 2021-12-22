ActiveAdmin.register HouseholdPerson do

  menu false

  permit_params :no, 
                :name, 
                :age, 
                :sex, 
                :nationality, 
                :civil_status, 
                :migrated, 
                :highest_education, 
                :school_attended, 
                :osy, 
                :household_id,
                :can_read,
                :employment,
                :employment_type,
                :type_of_work,
                :family_income,
                :dialect,
                :religion

  
  form do |f|
    f.object.household_id = params[:household_id] if params[:household_id].present?
    f.semantic_errors *f.object.errors.keys
    f.input :household, member_label: :house_no, wrapper_html: {class: 'hidden'}
    f.input :name
    f.input :no
    f.input :age
    f.input :sex, collection: HouseholdPerson.sexes, include_blank: false
    f.input :nationality
    f.input :civil_status, collection: HouseholdPerson.civil_statuses, include_blank: false
    f.input :migrated, label: 'Migrated from other place (2005 to present)', collection: HouseholdPerson.migrateds, include_blank: false
    f.input :highest_education, collection: HouseholdPerson.highest_educations, include_blank: false
    f.input :school_attended, collection: HouseholdPerson.school_attendeds, include_blank: false
    f.input :osy, label: 'OSY (for 6 to 21 years old)', as: :select, collection: HouseholdPerson.can_reads, include_blank: false
    f.input :can_read, as: :select, collection: HouseholdPerson.can_reads, include_blank: false
    f.input :employment
    f.input :employment_type, as: :select, collection: HouseholdPerson.employment_types, include_blank: false
    f.input :type_of_work, as: :select, collection: HouseholdPerson.type_of_works, include_blank: false
    f.input :family_income
    f.input :dialect, as: :select, collection: HouseholdPerson.dialects, include_blank: false
    f.input :religion, as: :select, collection: HouseholdPerson.religions, include_blank: false
    f.actions
  end
  
  controller do
    def update
      super do |success,failure|
        success.html { redirect_to admin_household_path(resource.household_id) }
      end
    end
    def create
      super do |success,failure|
        success.html { redirect_to admin_household_path(resource.household_id) }
      end
    end
  end
end
