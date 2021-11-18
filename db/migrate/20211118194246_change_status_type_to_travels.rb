class ChangeStatusTypeToTravels < ActiveRecord::Migration[6.0]
  def change
    change_column :travels, :status, 'boolean USING CAST(status AS boolean)'
  end
end
