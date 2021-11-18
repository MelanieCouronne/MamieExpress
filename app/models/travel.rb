class Travel < ApplicationRecord
  belongs_to :user
  include PgSearch::Model

  geocoded_by :departure_location, latitude: :latitude, longitude: :longitude
  after_validation :geocode, if: :will_save_change_to_departure_location?
  geocoded_by :arrival_location, latitude: :arrival_latitude, longitude: :arrival_longitude
  after_validation :geocode, if: :will_save_change_to_arrival_location?

  validates :departure_location, presence: true
  # validates :departure_date, presence: true
  # validates :departure_hour, presence: true
  validates :arrival_location, presence: true
  validates :number_passenger, presence: true

  pg_search_scope :search_by_departure,
    against: [ :departure_location ],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_arrival,
    against: [ :arrival_location ],
    using: {
      tsearch: { prefix: true }
  }

  pg_search_scope :search_by_date,
    against: [ :departure_date ],
    using: {
      tsearch: { prefix: true }
  }

  pg_search_scope :search_by_number,
    against: [ :number_passenger ],
    using: {
      tsearch: { prefix: true }
  }
end
