class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :post_title, null: false
      t.text :post_body, null: false
      t.string :image_id, null: false
      t.references :chinchilla, foreign_key: true

      t.timestamps
    end
  end
end
