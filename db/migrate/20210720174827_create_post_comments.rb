class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment, null: false
      t.references :owner, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
