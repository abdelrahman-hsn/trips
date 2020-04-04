class TripSerializer < ActiveModel::Serializer
  attributes :id, :city, :status, :driver, :start_trip, :end_trip, :full_trips_history

  def driver
    instance_options[:without_serializer] ? object.driver : DriverSerializer.new(object.driver, without_serializer: true)
  end

  def start_trip
    # start_trip = $redis.lrange("start_trip_#{object.id}", 0, -1)
    
    # if !start_trip.empty?
    #   result = []
    #   start_trip.each do |location| 
    #     result.push(JSON.parse(location))
    #   end
    #   start_trip = result.flatten
    # else
    #   start_trip = object.full_trips.first
    #   $redis.lpush("start_trip_#{object.id}", start_trip.to_json)
    # end
    # start_trip = object.full_trips.first

    object.full_trips.first
  end

  def end_trip
    object.full_trips.last
  end

  def full_trips_history
    trip_history = $redis.lrange("full_trip_#{object.id}_history", 0, -1)
    # byebug
    # if(trip_history.length > 0)
    if !trip_history.empty?
      result = []
      trip_history.each do |location| 
        result.push(JSON.parse(location))
      end
      trip_history = result.flatten
    else
      trip_history = object.full_trips
      $redis.lpush("full_trip_#{object.id}_history", trip_history.to_json)
    end
    trip_history
  end
end
