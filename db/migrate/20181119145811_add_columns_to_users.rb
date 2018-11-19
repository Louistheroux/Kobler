class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :full_name, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
  end
end
