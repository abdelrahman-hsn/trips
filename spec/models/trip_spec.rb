require 'rails_helper'

RSpec.describe Trip, type: :model do
  describe 'Require validations' do
    it 'should has a city' do
      should validate_presence_of(:city)
    end

    it 'should has a status' do
      should validate_presence_of(:status)
    end

    it 'should has a ongoing' do
      should validate_presence_of(:ongoing)
    end

    it 'should has a driver_id ' do
      should validate_presence_of(:driver_id)
    end
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
