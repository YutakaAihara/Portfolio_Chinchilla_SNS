class RemoveImageIdFromHospitals < ActiveRecord::Migration[5.2]
  def change
    remove_column :hospitals, :image_id, :string
  end
end
