class AddStatusToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :status, :string, default: "to_finish"
  end
end
