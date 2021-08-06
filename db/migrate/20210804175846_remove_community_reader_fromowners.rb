class RemoveCommunityReaderFromowners < ActiveRecord::Migration[5.2]
  def up
    remove_column :owners, :community_reader
  end
  
  def down
    add_column :owners, :community_reader, :boolean, default: false
  end
end
