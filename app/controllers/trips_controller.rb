# frozen_string_literal: true

class TripsController < ApplicationController
  before_action :set_trip, only: %i[show update destroy update_location]

  # GET /trips
  def index
    @trips = Trip.paginate(page: params[:page])

    render json: @trips, adapter: :json
  end

  # GET /trips/1
  def show
    render json: @trip
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      render json: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
    head :no_content
  end

  # POST /trips/1/update_location
  def update_location
    location = {
      city: full_trip_params[:city],
      longitude: full_trip_params[:longitude],
      latitude: full_trip_params[:latitude],
      trip_id: @trip.id
    }
    #byebug
    TrackFullTripsWorker.perform_async(location)
    render json: { data: 'location saved' }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = Trip.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def trip_params
    params.require(:trip).permit(:city, :start_trip_id, :end_trip_id, :status,
                                 :ongoing, :driver_id)
  end

  def full_trip_params
    params.require(:full_trip).permit(:city, :longitude, :latitude, :trip_id)
  end
end
