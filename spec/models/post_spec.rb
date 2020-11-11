require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '正常系の機能' do
    context '投稿する' do
      it '正しく投稿できること user_id: 1, caption: test' do
        post_a = FactoryBot.create(:post, id: '1', caption: 'testを書いています')
        expect(post_a).to be_valid
        post_a.save
        answered_post = Post.find(1)
        expect(answered_post.user_id).to eq(1)
        expect(answered_post.caption).to eq('testを書いています')
      end
    end
  end         
end
