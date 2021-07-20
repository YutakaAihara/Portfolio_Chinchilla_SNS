class CreateChinchillas < ActiveRecord::Migration[5.2]
  def change
    create_table :chinchillas do |t|
      t.string :name, null: false
      t.date :birthday
      t.integer :sex
      t.string :fur_type
      t.text :introduction
      t.string :image_id
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
