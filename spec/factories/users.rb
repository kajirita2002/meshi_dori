FactoryBot.define do
  factory :user do
    email { 'test@gmail.com' }
    encrypted_password { '123456' }
    name { 'test' }
  end
end