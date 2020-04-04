# frozen_string_literal: true

class TrackFullTripsWorker
  include Sidekiq::Worker

  def perform(location_params)
    location = FullTrip.create(location_params)
    $redis.lpush("full_trip_#{location_params['trip_id']}_history", location.to_json)
  end
end
