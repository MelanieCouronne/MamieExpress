class AddDateToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :departure_date, :datetime
    add_column :travels, :arrival_date, :datetime
  end
end
