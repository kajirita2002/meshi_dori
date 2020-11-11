require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe '正常系の機能' do
    context '写真登録する' do
      it '正しく登録できること ' do
        photo_a = FactoryBot.create(:photo, image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')))
        expect(photo_a).to be_valid
        photo_a.save
      end
    end
  end
end
