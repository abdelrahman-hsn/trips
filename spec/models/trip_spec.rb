require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Require validations' do
    it 'should has a city' do
      should validate_presence_of(:city)
    end

    it 'should has a status' do
      should validate_presence_of(:status)
    end

    it 'should has a driver_id ' do
      should validate_presence_of(:driver_id)
    end
  end

  it 'change trip status' do
    trip = Trip.create(city: 'suez', status: 1, driver_id: 1)
    trip.update(status: 0)
    expect(trip.errors[:status][0]).to eq('you cannot update trip status after it completed')
  end

  describe 'Has associations' do
    it 'belongs to driver' do
      should belong_to :driver
    end

    it 'has many full_trips' do
      should have_many :full_trips
    end
  end
end
