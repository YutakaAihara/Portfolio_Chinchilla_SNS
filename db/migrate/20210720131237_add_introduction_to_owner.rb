class AddIntroductionToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :introduction, :text
  end
end
