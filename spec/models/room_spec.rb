require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  # bundle exec rspec spec/models/room_spec.rb 

  describe 'チャットルームの作成' do
    context 'チャットルーム作成がうまくいくとき' do
      it "client_idがあれば作成できる" do
        expect(@room).to be_valid
      end
    end

    context 'チャットルーム作成がうまくいかないとき' do
      it "すでにチャットルームがある場合は作成できない" do
        @room.client_id = 1
        @room2 = FactoryBot.build(:room)
        @room2.client_id = 1
        @room2.valid?
        expect(@room2.errors.full_messages).to include("Clientを入力してください")
      end
    end
  end
end
