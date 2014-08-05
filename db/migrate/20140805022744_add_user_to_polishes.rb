class AddUserToPolishes < ActiveRecord::Migration
  def change
    add_column :polishes, :user_id, :integer
    add_index :polishes, :user_id
  end
end
