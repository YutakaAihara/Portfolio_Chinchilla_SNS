class AddReaderIdToCommunity < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :reader_id, :intege
  end
end
