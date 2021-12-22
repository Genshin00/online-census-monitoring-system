class AddMoreDetailsToHouseholdPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :household_people, :can_read, :string
    add_column :household_people, :employment, :string
    add_column :household_people, :employment_type, :string
    add_column :household_people, :type_of_work, :string
    add_column :household_people, :family_income, :integer
    add_column :household_people, :dialect, :string
    add_column :household_people, :religion, :string
  end
end
