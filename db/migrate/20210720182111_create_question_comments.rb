class CreateQuestionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :question_comments do |t|
      t.text :comment, null: false
      t.references :owner, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
