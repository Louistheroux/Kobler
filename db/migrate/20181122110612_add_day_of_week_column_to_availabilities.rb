class AddDayOfWeekColumnToAvailabilities < ActiveRecord::Migration[5.2]
  def change
    add_column :availabilities, :day_of_week, :string
  end
end
