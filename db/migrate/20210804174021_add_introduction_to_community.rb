class AddIntroductionToCommunity < ActiveRecord::Migration[5.2]
  def change
    add_column :communities, :introduction, :text
  end
end
