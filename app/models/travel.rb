class Travel < ApplicationRecord
  belongs_to :user

  geocoded_by :departure_location, latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: :will_save_change_to_departure_location?
  geocoded_by :arrival_location, latitude: :arrival_latitude, longitude: :arrival_longitude
  after_validation :geocode, if: :will_save_change_to_arrival_location?

  validates :departure_location, presence: true
  # validates :departure_date, presence: true
  # validates :departure_hour, presence: true
  validates :arrival_location, presence: true
  validates :number_passenger, presence: true
end
