class ChangeReaderIdToCommunities < ActiveRecord::Migration[5.2]
  def change
    change_column :communities, :reader_id, :integer, null: false
  end
end
