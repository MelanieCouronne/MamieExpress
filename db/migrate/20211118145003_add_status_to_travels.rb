class AddStatusToTravels < ActiveRecord::Migration[6.0]
  def change
    add_column :travels, :status, :string
  end
end
