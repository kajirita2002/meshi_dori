require 'rails_helper'

describe '投稿管理機能', type: :system do

  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@gmail.com', password: '123456') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@gmail.com', password: '123456') }
  let!(:photo_a) { FactoryBot.create(:photo, post: post_a) }
  let!(:post_a) { FactoryBot.create(:post, caption: '最初の投稿', user: user_a) }
  
  before do
    visit new_user_session_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'SignIn'
  end

  shared_examples_for 'ユーザーAが作成した投稿が表示される' do
    it {expect(page).to have_content '最初の投稿' }
  end
  
  describe '一覧表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成した投稿が表示される'
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it_behaves_like 'ユーザーAが作成した投稿が表示される'
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit post_path(post_a)
      end

      it 'ユーザーAが作成した投稿が表示される' do
        expect(page).to have_content '最初の投稿'
      end
    end
  end
  
  describe '新規投稿作成機能' do
    let(:login_user) { user_a }

    before do
      visit new_post_path
      fill_in '食べ物について書く', with: post_caption
      attach_file 'ファイルをアップロード', "#{Rails.root}/spec/fixtures/test.jpg"
      click_button '投稿する'
    end

    context '新規作成画面でcaptionを入力した時' do
      let(:post_caption) { '新規作成の見出しを書く' }

      it '正常に登録される' do
        expect(page).to have_content '投稿が保存されました'
      end
    end

    context '新規作成画面で見出しを入力しなかった時' do
      let(:post_caption) { '' }

      it 'エラーになる' do
        within '.alert-danger' do
          expect(page).to have_content '投稿に失敗しました'
        end
      end
    end
  end
end
