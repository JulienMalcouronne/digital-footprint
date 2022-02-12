class AddColAdditionalFactorToFootprint < ActiveRecord::Migration[7.0]
  def change
    add_column :footprints, :additional_factor, :float, :default => 1.0
  end
end
