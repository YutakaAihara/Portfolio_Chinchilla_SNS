class CreateQuestionImages < ActiveRecord::Migration[5.2]
  def change
    create_table :question_images do |t|
      t.string :image_id, null: false
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
