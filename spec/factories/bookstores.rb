FactoryBot.define do
    factory :bookstore do
      title { Faker::Lorem.word}
      deskripsi { Faker::Number.number(10) }
    end
  end