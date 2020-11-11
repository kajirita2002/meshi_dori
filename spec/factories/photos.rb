FactoryBot.define do 
  factory :photo do
    id { '1' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    association :post
  end
end
