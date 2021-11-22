class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.references :barangay, null: false, foreign_key: true
      t.string :sitio
      t.string :house_no
      t.date :date_of_survey
      t.string :informant
      t.string :surveyed_by
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
