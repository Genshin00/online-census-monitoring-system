class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.references :household, null: false, foreign_key: true
      t.integer :vehicle_type
      t.integer :quantity

      t.timestamps
    end
  end
end
