class ChangeTimesToIntegersInAvailabilities < ActiveRecord::Migration[5.2]
  def change
    remove_column :availabilities, :start_time
    remove_column :availabilities, :end_time
    add_column :availabilities, :start_time, :integer
    add_column :availabilities, :end_time, :integer
  end
end
