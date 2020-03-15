FactoryBot.define do
    factory :item do
      name { Faker::Lorem.word }
      done false
      bookstore_id nil
    end
  end