class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :phone_number
      t.string :email
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
