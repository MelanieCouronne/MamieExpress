class AddArrivalLocationToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :arrival_location, :string
  end
end
