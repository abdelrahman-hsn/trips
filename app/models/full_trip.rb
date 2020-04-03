# frozen_string_literal: true
class FullTrip < ApplicationRecord
  # Associations
  belongs_to :trip
  # Validations
  validates_presence_of :city, :longitude, :latitude, :trip_id
end
