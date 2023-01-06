FactoryBot.define do
  factory :item do
    association :user 
    name                    { "korehatesutodesu" }
    description             { "これはテスト出品です" }
    price                   {20000}
    category_id             { 3 }
    condition_id            { 3 }
    shipping_date_id        { 3 }
    shipping_charge_id      { 3 }
    prefecture_id           { 3 }   
    # image {Faker::Lorem.sentence}
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end

