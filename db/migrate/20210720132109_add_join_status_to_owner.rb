class AddJoinStatusToOwner < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :join_status, :boolean, default: true
  end
end
