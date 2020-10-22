require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "name,name_kana,staff_number,email,password,password_confirmation,position_id,qualification_id,work_style_idが揃っていれば登録できる" do
        expect(@user).to be_valid
      end
      it "pictureは空でも登録できる" do
        @user.picture = ""
        expect(@user).to be_valid
      end
    end
  
    context '新規登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が空です。")
      end
      it "name_kanaが空だと登録できない" do
        @user.name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（カタカナ）が空です。")
      end
      it "staff_numberが空だと登録できない" do
        @user.staff_number = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("スタッフ番号が空です。")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it "password_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）が空です。")
      end
      it "qualification_idが1だと登録できない" do
        @user.qualification_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("保有資格が選択されていません")
      end
      it "work_style_idが1だと登録できない" do
        @user.work_style_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("勤務形態が選択されていません")
      end
      it "passwordとpassword_confirmationが一致しないと登録できない" do
        @user.password = "aaaa1111"
        @user.password_confirmation = "aaaa1112"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "name_kanaがカタカナ以外だと登録できない" do
        @user.name_kana = "てすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("フリガナ（カタカナ）は全角カタカナのみ登録できます。")
      end
      it "passwordは8文字未満だと登録できない" do
        @user.password = "test123"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは8文字以上の半角英数字混合で登録できます。")
      end
      it "passwordは半角英数字混合でなければ登録できない" do
        @user.password = "testtest"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは8文字以上の半角英数字混合で登録できます。")
      end
      it "staff_numberが数字以外だと登録できない" do
        @user.staff_number = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("スタッフ番号は数字のみ登録できます。")
      end
    end
  
  end
end
