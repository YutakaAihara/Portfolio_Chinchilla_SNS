class ChangeColumnToOwners < ActiveRecord::Migration[5.2]
  def up
    change_column :owners, :prefecture, :integer, null: false, default: 0
  end

  def down
    change_column :owners, :prefecture, :string, null: false
  end
end
