FactoryBot.define do
  factory :buy_address do
    token                  { "tok_abcdefghijk00000000000000000" }
    postal_code            { "123-4567" } 
    prefecture_id          { 1 } 
    city                   { "田中市" } 
    house_number           { "田中町山田123" } 
    building_name          { "田中ビル1" } 
    phone_number           { "00000000000" } 
  end
end