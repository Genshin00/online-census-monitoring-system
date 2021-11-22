class AddMoreInfoToHousehold < ActiveRecord::Migration[6.0]
  def change
    add_column :households, :house, :string
    add_column :households, :lot, :string
    add_column :households, :house_type, :string
    add_column :households, :material, :string
    add_column :households, :electricity, :string
    add_column :households, :telecommunication, :string
    add_column :households, :toilet_facilities, :string
    add_column :households, :refuse_disposal, :string
    add_column :households, :fuel, :string
    add_column :households, :water_supply, :string
    add_column :households, :housing_risk_factor, :string
  end
end
