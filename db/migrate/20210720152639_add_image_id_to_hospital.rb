class AddImageIdToHospital < ActiveRecord::Migration[5.2]
  def change
    add_column :hospitals, :image_id, :string
  end
end
