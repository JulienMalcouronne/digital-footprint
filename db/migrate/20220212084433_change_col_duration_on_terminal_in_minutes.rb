class ChangeColDurationOnTerminalInMinutes < ActiveRecord::Migration[7.0]
  def change
    remove_column :footprints, :duration_on_terminal, :float
    add_column :footprints, :duration_on_terminal, :integer
  end
end
