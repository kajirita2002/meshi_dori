require 'rails_helper'

describe '投稿管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      #ユーザーAを作成しておく（テストデータの準備）
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@gmail.com', password: '123456')
      #作成者がユーザーAであるタスクを作成しておく
      post_a = FactoryBot.create(:post, caption: '最初の投稿', user: user_a)
      FactoryBot.create(:photo, post: post_a)
    end
    context 'ユーザーがログインしている時' do
      before do
        # ユーザーAでログインする(前提となるユーザーの操作)
        visit new_user_session_path
        fill_in 'メールアドレス', with: 'a@gmail.com'
        fill_in 'パスワード', with: '123456'
        click_button 'SignIn'
      end

      it 'ユーザーAが作成したタスクが表示される' do
        #作成済みのタスクの名称が画面上に表示されていることを確認
        expect(page).to have_content '最初の投稿'
      end
    end
  end
end