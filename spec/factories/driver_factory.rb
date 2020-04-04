FactoryBot.define do
  factory :driver do
    email { Faker::Internet.email }
    name {Faker::Name.name}
    city {Faker::Address.city}
    phone_number {Faker::PhoneNumber.phone_number}
    available {true}
  end
end
