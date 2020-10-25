require 'rails_helper'
require "date"

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
  end
  binding.pry

  # bundle exec rspec spec/models/record_spec.rb 

  describe '記録の保存' do
    context '記録の保存がうまくいくとき' do
      it "client_id,user_id,major_item_id,main_item_id,sub_item_id,start_time,end_timeが揃っていれば保存できる" do
        expect(@record).to be_valid
      end
      it "memoは空でも保存できる" do
        @record.memo = ""
        expect(@record).to be_valid
      end
      it "exc_shape_idは空でも保存できる" do
        expect(@record).to be_valid
      end
      it "exc_amount_idは空でも保存できる" do
        expect(@record).to be_valid
      end
    end

    context '記録の保存がうまくいかないとき' do
      it "client_idが空だと保存できない" do
        @record.client_id = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("お客様IDを入力してください")
      end
      it "user_idが空だと保存できない" do
        @record.user_id = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("Userを入力してください")
      end
      it "start_timeが空だと保存できない" do
        @record.start_time = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("開始時刻を入力してください")
      end
      it "end_timeが空だと保存できない" do
        @record.end_time = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("終了時刻を入力してください")
      end
      it "major_item_idが空だと保存できない" do
        @record.major_item_id = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("大項目を入力してください")
      end
      it "main_item_idが空だと保存できない" do
        @record.main_item_id = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("中項目を入力してください")
      end
      it "sub_item_idが空だと保存できない" do
        @record.sub_item_id = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("小項目を入力してください")
      end
      it "major_item_idが1だと保存できない" do
        @record.major_item_id = 1
        @record.valid?
        expect(@record.errors.full_messages).to include("大項目が選択されていません。")
      end
      it "main_item_idが1だと保存できない" do
        @record.main_item_id = 1
        @record.valid?
        expect(@record.errors.full_messages).to include("中項目が選択されていません。")
      end
      it "sub_item_idが1だと保存できない" do
        @record.sub_item_id = 1
        @record.valid?
        expect(@record.errors.full_messages).to include("小項目が選択されていません。")
      end
      it "carryout_idが空だと保存できない" do
        @record.carryout_id = ""
        @record.valid?
        expect(@record.errors.full_messages).to include("実施状況を入力してください")
      end
      it "urine_amountが数字以外だと保存できない" do
        @record.urine_amount = "二十"
        @record.valid?
        expect(@record.errors.full_messages).to include("尿量は数字で入力してください。")
      end
      it "開始時刻が未来の場合は保存できない" do
        @record.start_time =  Time.now + 1.minute
        @record.carryout_id = 2
        @record.valid?
        expect(@record.errors.full_messages).to include("開始時刻未来の記録はできません")
      end
    end
  end

end
