class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question_title, null: false
      t.text :question_body, null: false
      t.boolean :solution_status, default: false

      t.timestamps
    end
  end
end
