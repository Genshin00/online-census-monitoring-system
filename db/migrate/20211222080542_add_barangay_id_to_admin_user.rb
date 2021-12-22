class AddBarangayIdToAdminUser < ActiveRecord::Migration[6.0]
  def change
    add_column :admin_users, :barangay_id, :integer
  end
end
