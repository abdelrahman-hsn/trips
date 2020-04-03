require 'rails_helper'

RSpec.describe Driver, type: :model do
  describe 'Require validations' do
    it 'should has a name' do
      should validate_presence_of(:name)
    end

    it 'should has an email' do
      should validate_presence_of(:email)
    end

    it 'should has a city' do
      should validate_presence_of(:city)
    end

    it 'should has a phone number' do
      should validate_presence_of(:phone_number)
    end
  end

  describe 'Has associations' do
    it 'has many experts' do
      should have_many :trips
    end
  end
end
