FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { 'abc132' }
    password_confirmation { password }
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    family_kana           { Gimei.last.katakana }
    first_kana            { Gimei.first.katakana }
    birthday              { Faker::Date.backward }
  end
end
