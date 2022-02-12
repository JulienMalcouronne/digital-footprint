class ChangeColCarbonFootPrintFromIntegerToFloat < ActiveRecord::Migration[7.0]
  def change
    remove_column :footprints, :carbon_footprint, :integer
    add_column :footprints, :carbon_footprint, :float
  end
end
