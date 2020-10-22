require 'rails_helper'

RSpec.describe Caregiver, type: :model do
  before do
    @caregiver = FactoryBot.build(:caregiver)
  end

  describe 'お客様介護情報登録' do
    context 'お客様介護情報登録がうまくいくとき' do
      it "degree_id,cognition_id,move_id,meal_id,excretion_id,oral_id,bathing_idが揃っていれば登録できる" do
        expect(@caregiver).to be_valid
      end
      it "move_expは空でも登録できる" do
        @caregiver.move_exp = ""
        expect(@caregiver).to be_valid
      end
      it "meal_expは空でも登録できる" do
        @caregiver.meal_exp = ""
        expect(@caregiver).to be_valid
      end
      it "excretion_expは空でも登録できる" do
        @caregiver.excretion_exp = ""
        expect(@caregiver).to be_valid
      end
      it "bathing_expは空でも登録できる" do
        @caregiver.bathing_exp = ""
        expect(@caregiver).to be_valid
      end
    end

    context 'お客様介護情報登録がうまくいかないとき' do
      it "degree_idが1だと登録できない" do
        @caregiver.degree_id = ""
        @caregiver.valid?
        expect(@caregiver.errors.full_messages).to include("要介護度が選択されていません")
      end
      it "cognition_idが1だと登録できない" do
        @caregiver.cognition_id = ""
        @caregiver.valid?
        expect(@caregiver.errors.full_messages).to include("認知機能が選択されていません")
      end
      it "move_idが1だと登録できない" do
        @caregiver.move_id = ""
        @caregiver.valid?
        expect(@caregiver.errors.full_messages).to include("移動が選択されていません")
      end
      it "meal_idが1だと登録できない" do
        @caregiver.meal_id = ""
        @caregiver.valid?
        expect(@caregiver.errors.full_messages).to include("食事が選択されていません")
      end
      it "excretion_idが1だと登録できない" do
        @caregiver.excretion_id = ""
        @caregiver.valid?
        expect(@caregiver.errors.full_messages).to include("排泄が選択されていません")
      end
      it "bathing_idが1だと登録できない" do
        @caregiver.bathing_id = ""
        @caregiver.valid?
        expect(@caregiver.errors.full_messages).to include("入浴が選択されていません")
      end
    end

  end

end
