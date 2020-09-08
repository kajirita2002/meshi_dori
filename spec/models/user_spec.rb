require 'rails_helper'

RSpec.describe User, type: :model do
  describe '正常系の機能' do
    context 'ユーザー登録する' do
      it '正しく登録できること メールアドレス: a@gmail.com, フルネーム: ユーザーA, パスワード: 123456' do
        user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@gmail.com', password: '123456')
        expect(user_a).to be_valid
        user_a.save
        answered_user = User.find(1)
        expect(answered_user.email).to eq('a@gmail.com')
        expect(answered_user.name).to eq('ユーザーA')
        expect(answered_user.password).to eq('123456')
      end
    end
  end
end