class RestoreDateTimeAfterAll < ActiveRecord::Migration[5.2]
  def change
    remove_column :availabilities, :start_time
    remove_column :availabilities, :end_time
    add_column :availabilities, :start_time, :datetime
    add_column :availabilities, :end_time, :datetime
  end
end
