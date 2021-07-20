class CreateFavoriteChinchillas < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_chinchillas do |t|
      t.references :owner, foreign_key: true
      t.references :chinchilla, foreign_key: true

      t.timestamps
    end
  end
end
