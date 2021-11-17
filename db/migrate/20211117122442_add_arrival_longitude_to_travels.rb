class AddArrivalLongitudeToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :arrival_longitude, :float
  end
end
