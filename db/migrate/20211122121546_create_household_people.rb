class CreateHouseholdPeople < ActiveRecord::Migration[6.0]
  def change
    create_table :household_people do |t|
      t.string :no
      t.string :name
      t.string :age
      t.string :sex
      t.string :nationality
      t.string :civil_status
      t.string :migrated
      t.string :highest_education
      t.string :school_attended
      t.string :osy

      t.timestamps
    end
  end
end
