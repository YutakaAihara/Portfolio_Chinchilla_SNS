class AddColumnToHospital < ActiveRecord::Migration[5.2]
  def change
    add_reference :hospitals, :owner, foreign_key: true
  end
end
