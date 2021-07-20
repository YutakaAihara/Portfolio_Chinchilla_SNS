class CreateHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitals do |t|
      t.string :hospital_name, null: false
      t.string :address, null: false
      t.float :latitude, null: false
      t.float :longitude, null: false
      t.text :comment, null: false
      t.float :rate, null: false

      t.timestamps
    end
  end
end
