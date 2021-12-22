class AddBusinessInfoToHousehold < ActiveRecord::Migration[6.0]
  def change
    add_column :households, :business, :string
    add_column :households, :floor_area, :string
    add_column :households, :number_of_employees, :integer
  end
end
