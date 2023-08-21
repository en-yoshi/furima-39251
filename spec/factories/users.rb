FactoryBot.define do
  factory :user do
    nickname               { 'test' }
    email                  { Faker::Internet.free_email }
    password               { 'test11' }
    password_confirmation  { password }
    last_name              { '遠藤' }
    last_name_kana         { 'エンドウ' }
    first_name             { '喜貴' }
    first_name_kana        { 'ヨシキ' }
    birthday               { '1930-01-01' }
  end
end