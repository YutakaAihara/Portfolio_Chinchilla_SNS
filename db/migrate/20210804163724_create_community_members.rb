class CreateCommunityMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :community_members do |t|
      t.references :community, foreign_key: true
      t.references :owner, foreign_key: true
      
      t.timestamps
    end
  end
end
