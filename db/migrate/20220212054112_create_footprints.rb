class CreateFootprints < ActiveRecord::Migration[7.0]
  def change
    create_table :footprints do |t|
      t.time :duration_on_terminal
      t.string :terminal_category
      t.integer :data_size
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
