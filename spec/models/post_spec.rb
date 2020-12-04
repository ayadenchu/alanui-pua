require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'Postの保存' do
    context "Postが保存できる場合" do
      it "全ての項目が埋まっていては保存される" do
        expect(@post).to be_valid
      end
      it "画像がなくても保存される" do
        @post.image = ""
        expect(@post).to be_valid
      end
    end
    context "postが保存できない場合" do
      it "タイトルがないと保存できない" do
        @post.title = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it "カテゴリーがないと保存できない" do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Category must be other than 1")
      end
      it "テキストがないとツイートは保存できない" do
        @post.text = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end     
      it "ユーザーが紐付いていないとツイートは保存できない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end