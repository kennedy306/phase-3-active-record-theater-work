require 'faker'

10.times do
    Role.create(character_name: Faker::TvShows::GameOfThrones.character)
  end
  50.times do
    Audition.create(
      actor: Faker::Name.name,
      location: Faker::Address.full_address,
      phone: Faker::PhoneNumber.phone_number,
      hired: Faker::Boolean.boolean,
      role_id: Role.pluck(:id).sample
    )
  end