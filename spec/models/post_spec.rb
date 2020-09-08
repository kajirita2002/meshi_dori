require 'rails_helper'

RSpec.describe Post, type: model do
  describe '正常系の機能' do
    context '投稿する' do
      before do
        photo_1 = Photo.new(image: )
      it '正しく投稿できること user_id: 1, caption: test' do
        post = Post.new(
          user_id: 1,
          caption: 1
        ) 
         
end