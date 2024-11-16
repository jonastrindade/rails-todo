class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :user, index: true
      t.string :title
      t.text :description
      t.date :deadline

      t.timestamps
    end
  end
end
