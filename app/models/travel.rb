class Travel < ApplicationRecord
  belongs_to :user

  validates :departure_location, presence: true
  validates :departure_date, presence: true
  validates :departure_hour, presence: true
  validates :arrival_location, presence: true
  validates :number_passenger, presence: true
end
