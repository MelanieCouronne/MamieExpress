class ChangeDateHourTypeToDateFormat < ActiveRecord::Migration[6.0]
  def change
    change_column :travels, :departure_date, 'Date USING CAST(departure_date AS Date)'
    change_column :travels, :departure_hour, 'Timestamp with time zone USING departure_hour::timestamp with time zone'
    change_column :travels, :arrival_date, 'Date USING CAST(arrival_date AS Date)'
    change_column :travels, :arrival_hour, 'Timestamp with time zone USING departure_hour::timestamp with time zone'
    change_column :travels, :number_passenger, 'Integer USING CAST(number_passenger AS Integer)'
  end
end
