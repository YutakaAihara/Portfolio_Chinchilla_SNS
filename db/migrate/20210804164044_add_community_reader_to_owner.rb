class AddCommunityReaderToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :community_reader, :boolean, default: false
  end
end
