require 'rails_helper'

RSpec.describe Client, type: :model do
  before do
    @client = FactoryBot.build(:client)
  end

  #bundle exec rspec spec/models/client_spec.rb 

  describe 'お客様新規登録' do
    context 'お客様登録がうまくいくとき' do
      it "name,name_kana,room_number,status_id,birthが揃っていれば登録できる" do
        expect(@client).to be_valid
      end
      it "pictureはからでも登録できる" do
        @client.picture = ""
        expect(@client).to be_valid
      end
    end

    context 'お客様登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @client.name = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("Name が空です")
      end
      it "name_kanaが空だと登録できない" do
        @client.name_kana = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("Name kana が空です")
      end
      it "room_numberが空だと登録できない" do
        @client.room_number = nil
        @client.valid?
        expect(@client.errors.full_messages).to include("Room number が空です")
      end
      it "status_idが1だと登録できない" do
        @client.status_id = 1
        @client.valid?
        expect(@client.errors.full_messages).to include("Status が選択されていません。")
      end
      it "name_kanaがカタカナ以外だと登録できない" do
        @client.name_kana = "すずきたろう"
        @client.valid?
        expect(@client.errors.full_messages).to include("Name kana は全角カタカナのみ登録できます。")
      end
    end
  end
end
