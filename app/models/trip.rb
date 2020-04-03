# frozen_string_literal: true
class Trip < ApplicationRecord
  # Associations
  belongs_to :driver
  has_many :full_trips
  has_one :start_trip, class_name: 'FullTrip', foreign_key: 'start_trip_id', optional: true
  has_one :end_trip, class_name: 'FullTrip', foreign_key: 'end_trip_id', optional: true
  # Validations
  validates_presence_of :city, :status, :ongoing, :driver_id
end
