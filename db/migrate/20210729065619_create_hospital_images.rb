class CreateHospitalImages < ActiveRecord::Migration[5.2]
  def change
    create_table :hospital_images do |t|
      t.references "hospital", foreign_key: true, null: false
      t.string "image_id"

      t.timestamps
    end
  end
end
