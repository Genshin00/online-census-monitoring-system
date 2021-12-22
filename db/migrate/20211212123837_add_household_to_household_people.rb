class AddHouseholdToHouseholdPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :household_people, :household_id, :integer
  end
end
