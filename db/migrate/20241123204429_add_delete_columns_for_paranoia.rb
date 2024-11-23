class AddDeleteColumnsForParanoia < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at

    add_column :tasks, :deleted_at, :datetime
    add_index :tasks, :deleted_at
  end
end
