class CreateTravels < ActiveRecord::Migration[6.0]
  def change
    create_table :travels do |t|
      t.string :departure_date
      t.string :departure_hour
      t.string :arrival_date
      t.string :arrival_hour
      t.string :number_passenger
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
