class AddReferenceToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :owner, foreign_key: true
  end
end
