class CreateTimeSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :time_schedules do |t|
      t.references :instructor, foreign_key: true
      t.references :school, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
