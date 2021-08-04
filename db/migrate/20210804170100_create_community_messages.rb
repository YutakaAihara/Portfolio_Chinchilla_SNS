class CreateCommunityMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :community_messages do |t|
      t.references :community, foreign_key: true
      t.references :owner, foreign_key: true
      t.string :message_body, null: false
      t.timestamps
    end
  end
end
