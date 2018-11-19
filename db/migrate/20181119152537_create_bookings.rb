class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :instructor, foreign_key: true
      t.references :student, foreign_key: true
      t.references :pick_up_point
      t.references :drop_off_point

      t.timestamps
    end
  end
end
