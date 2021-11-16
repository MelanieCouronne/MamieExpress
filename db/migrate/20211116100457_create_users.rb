class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :gender
      t.string :adresse
      t.string :driver_licence
      t.string :username
      t.string :password
      t.string :type_of_car
      t.boolean :driver

      t.timestamps
    end
  end
end
