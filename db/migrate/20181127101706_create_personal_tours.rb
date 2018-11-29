class CreatePersonalTours < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_tours do |t|
      t.string :driving_school_name
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.integer :number_of_teachers

      t.timestamps
    end
  end
end
