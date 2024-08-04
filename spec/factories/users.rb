FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.email }
    password               { 'password1A' }
    password_confirmation  { password }
    family_name_kanji      { 'やマ田' }
    first_name_kanji       { 'りク太郎' }
    family_name_kana       { 'ヤマダ' }
    first_name_kana        { 'リクタロウ' }
    birthday               { Faker::Date.birthday }
  end
end
