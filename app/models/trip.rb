# frozen_string_literal: true

class Trip < ApplicationRecord
  # Enum
  enum status: %i[ongoing completed]
  # Associations
  belongs_to :driver
  has_many :full_trips
  # Validations
  validates_presence_of :city, :status, :driver_id
  validate :trip_is_completed, on: :update
  after_destroy :clear_cache

  private

  def clear_cache
    $redis.del("full_trip_#{id}_history")
  end

  # Update trip status: the status can be only changed in one direction
  def trip_is_completed
    if status == 'ongoing' && status_was == 'completed'
      errors.add(:status, 'you cannot update trip status after it completed')
    end
  end
end
