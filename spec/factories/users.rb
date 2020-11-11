FactoryBot.define do
  factory :user do
    id { '1' }
    email { 'test@gmail.com' }
    name { 'test' }
    password { '123456' }
  end
end
