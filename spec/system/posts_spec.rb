require 'rails_helper'

describe '投稿管理機能', type: :system do
  describe '一覧表示機能' do

    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@gmail.com', password: '123456') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@gmail.com', password: '123456') }
    let!(:post_a) { FactoryBot.create(:post, caption: '最初の投稿', user: user_a }
    let(:photo_a){ FactoryBot.create(:photo, post: post_a) }

    before do
      visit new_user_session_path
      fill_in 'メールアドレス', with: login_user.email
      fill_in 'パスワード', with: login_user.password
      click_button 'SignIn'
    end

    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }
      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content '最初の投稿'
      end
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }
      it 'ユーザーAが作成したタスクが表示される' do
        expect(page).to have_content '最初の投稿'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit post_path(post_a)
      end

      it 'ユーザーAが作成した投稿が表示される' do
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end