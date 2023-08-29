FactoryBot.define do
  factory :item do
    name                  { Faker::Lorem.paragraph_by_chars(number: 20) }
    description           { Faker::Lorem.paragraph_by_chars(number: 500) }
    category_id           { Faker::Number.within(range: 1..10) }
    item_status_id        { Faker::Number.within(range: 1..6) }
    fee_status_id         { Faker::Number.within(range: 1..2) }
    prefecture_id         { Faker::Number.within(range: 1..47) }
    delivery_schedule_id  { Faker::Number.within(range: 1..3) }
    price                 { Faker::Number.within(range: 300..9_999_999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
