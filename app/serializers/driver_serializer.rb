class DriverSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :city, :phone_number
end
