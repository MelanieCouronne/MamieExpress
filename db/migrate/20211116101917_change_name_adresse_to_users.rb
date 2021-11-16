class ChangeNameAdresseToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column(:users, :adresse, :address)
  end
end
