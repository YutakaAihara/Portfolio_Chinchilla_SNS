class AddImageIdToCommunity < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :image_id, :string
  end
end
