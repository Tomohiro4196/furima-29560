FactoryBot.define do
  factory :item do
    item_name               { Faker::Lorem.words }
    description             { Faker::Lorem.sentence }
    category_id             { rand(2..11) }
    condition_id            { rand(2..7) }
    days_ship_id            { rand(2..4) }
    prefecture_id           { rand(2..48) }
    shipping_fee_id         { rand(2..3) }
    price                   { rand(300..9_999_999) }

    association :user
  end
end
