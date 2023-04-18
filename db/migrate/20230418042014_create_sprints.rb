class CreateSprints < ActiveRecord::Migration[7.0]
  def change
    create_table :sprints do |t|
      t.string :name, null: false
      t.date :start_at, null: false
      t.date :end_at, null: false
      t.boolean :is_archived, null: false, default: false

      t.timestamps
    end
  end
end
