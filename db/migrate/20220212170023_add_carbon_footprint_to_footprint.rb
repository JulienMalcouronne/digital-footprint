class AddCarbonFootprintToFootprint < ActiveRecord::Migration[7.0]
  def change
    add_column :footprints, :carbon_footprint, :integer
  end
end
