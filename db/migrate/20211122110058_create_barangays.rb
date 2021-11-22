class CreateBarangays < ActiveRecord::Migration[6.0]
  def change
    create_table :barangays do |t|
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
