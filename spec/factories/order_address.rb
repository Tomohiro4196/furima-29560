FactoryBot.define do
  factory :order_address do
    token                     { 'tok_b3f051bfab0d0d0d3947ae570d1f' }
    zip_code                  { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id             { rand(2..48) }
    city                      { Gimei.city.kanji }
    town_block                { Gimei.town.kanji }
    building_name             { 'サンライズマンション101号室' }
    phone_number              { Faker::Number.number(digits: 11) }
  end
end
