class AddColumnToBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :time_schedule, foreign_key: true
  end
end
