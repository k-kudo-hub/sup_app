require 'rails_helper'

RSpec.describe Detail, type: :model do
  before do
    @detail = FactoryBot.build(:detail)
  end

  #bundle exec rspec spec/models/detail_spec.rb
  
  describe 'お客様医療情報登録' do
    context 'お客様医療情報登録がうまくいくとき' do
      it "mbp_high,mbp_lowが揃っていれば登録できる" do
        expect(@detail).to be_valid
      end
      it "past_historyは空でも登録できる" do
        @detail.past_history = ""
        expect(@detail).to be_valid
      end
      it "illnessは空でも登録できる" do
        @detail.illness = ""
        expect(@detail).to be_valid
      end
      it "medicineは空でも登録できる" do
        @detail.medicine = ""
        expect(@detail).to be_valid
      end
    end

    context 'お客様医療情報登録がうまくいかないとき' do
      it "mbp_highが空だと登録できない" do
        @detail.mbp_high = nil
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Mbp high が空です")
      end
      it "mbp_lowが空だと登録できない" do
        @detail.mbp_low = nil
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Mbp low が空です")
      end
      it "mbp_highが数字以外だと登録できない" do
        @detail.mbp_high = "あああ"
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Mbp high は半角数字で入力してください")
      end
      it "mbp_lowが空だと登録できない" do
        @detail.mbp_low = "あああ"
        @detail.valid?
        expect(@detail.errors.full_messages).to include("Mbp low は半角数字で入力してください")
      end
    end

  end
end
