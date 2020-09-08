require 'rails_helper'

RSpec.describe Post, type: :system do
  describe '正常系の機能' do
    context 'サインアップする' do
      it 'サインアップが完了し、ホーム画面に遷移、「アカウントが登録されました。」とflashで表示される。' do
        visit new_user_registration_path
        fill_in 'メールアドレス', with: 'a@gmail.com'
        fill_in 'フルネーム', with: 'ユーザーA'
        fill_in 'パスワード', with: '123456'
        fill_in 'パスワードの確認', with: '123456'
        click_button 'SignUp'

        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end

    context 'サインインする' do 
      before do
        user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@gmail.com', password: '123456')
      end

      it 'サインインが成功し、ホーム画面に遷移,「サインインしました。」とflashで表示される' do
        visit visit new_user_session_path
        fill_in 'メールアドレス', with: 'a@gmail.com'
        fill_in 'パスワード', with: '123456'
        click_button 'SignIn'
        expect(page).to have_content 'サインインしました。'
      end
    end
  end
end