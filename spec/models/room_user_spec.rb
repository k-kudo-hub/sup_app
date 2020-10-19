require 'rails_helper'

RSpec.describe RoomUser, type: :model do
  before do
    @room_user = FactoryBot.build(:room_user)
  end

  describe 'チャットルームへのユーザー登録' do
    context 'チャットルームへのユーザー登録がうまくいくとき' do
      it "room_id,user_idがあれば登録できる" do
        expect(@room_user).to be_valid
      end
    end

    context 'チャットルームへのユーザー登録がうまくいかないとき' do
      it "ルーム情報が存在しない場合は登録できない" do
        @room_user.room = nil
        @room_user.valid?
        expect(@room_user.errors.full_messages).to include("Roomを入力してください")
      end
      it "ユーザー情報が存在しない場合は登録できない" do
        @room_user.user = nil
        @room_user.valid?
        expect(@room_user.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
