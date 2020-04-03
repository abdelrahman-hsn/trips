require 'rails_helper'

RSpec.describe FullTrip, type: :model do
  describe 'Require validations' do
    it 'should has a city' do
      should validate_presence_of(:city)
    end

    it 'should has a longitude' do
      should validate_presence_of(:longitude)
    end

    it 'should has a latitude' do
      should validate_presence_of(:latitude)
    end

    it 'should has a trip_id ' do
      should validate_presence_of(:trip_id)
    end
  end

  describe 'Has associations' do
    it 'belongs to driver' do
      should belong_to :trip
    end
  end
end
