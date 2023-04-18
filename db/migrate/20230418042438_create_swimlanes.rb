class CreateSwimlanes < ActiveRecord::Migration[7.0]
  def change
    create_table :swimlanes do |t|
      t.string :name, null: false
      t.string :description
      t.references :sprint, foreign_key: true

      t.timestamps
    end
  end
end
