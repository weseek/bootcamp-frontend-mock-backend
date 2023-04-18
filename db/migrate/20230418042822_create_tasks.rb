class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false
      t.string :status, null: false, default: 'new'
      t.string :description
      t.references :swimlane, null: false, foreign_key: true
      t.references :assignee, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
