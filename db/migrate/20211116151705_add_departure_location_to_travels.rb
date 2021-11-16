class AddDepartureLocationToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :departure_location, :string
  end
end
