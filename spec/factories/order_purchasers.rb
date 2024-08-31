FactoryBot.define do
  factory :order_purchaser do
    postal_code { '111-1111' }
    area_id { 2 }
    city { '札幌市' }
    street_address { 'ススキノ' }
    building_name { 'ドンキ' }
    phone_number { '1234567890' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
