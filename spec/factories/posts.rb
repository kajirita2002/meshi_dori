FactoryBot.define do 
  factory :post do
    caption { 'testを書いています' }
    user 
  end
end