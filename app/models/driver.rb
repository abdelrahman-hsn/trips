# frozen_string_literal: true
class Driver < ApplicationRecord
  # Associations
  has_many :trips
  # Validations
  validates_presence_of :name, :email, :phone_number, :city
end
