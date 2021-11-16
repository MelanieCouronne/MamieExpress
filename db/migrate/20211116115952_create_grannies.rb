class CreateGrannies < ActiveRecord::Migration[6.0]
  def change
    create_table :grannies do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_birth
      t.string :gender
      t.string :granny_mobility
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
