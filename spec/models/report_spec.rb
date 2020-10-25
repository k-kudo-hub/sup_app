require 'rails_helper'

RSpec.describe Report, type: :model do
  before do
    @report = FactoryBot.build(:report)
  end

  # bundle exec rspec spec/models/report_spec.rb 

  describe "事故報告書の保存" do
    
    context "事故報告書の保存ができるとき" do
      it "client_id,user_id,occ_time,place_id,genre_id,res_id,level_idが揃っていれば下書き(check_id = 0)として保存できる" do
        @report.content = nil
        @report.coping = nil
        @report.contact_id = nil
        @report.desc_date = nil
        @report.desc_user = nil
        @report.desc_content = nil
        @report.count_content = nil
        expect(@report).to be_valid
      end
      it "client_id,user_id,occ_time,place_id,genre_id,res_id,level_id,content,coping,contact_idが揃っていれば本人承認(check_id = 1)として保存できる" do
        @report.check_id = 1
        @report.desc_date = nil
        @report.desc_user = nil
        @report.desc_content = nil
        @report.count_content = nil
        expect(@report).to be_valid
      end
      it "client_id,user_id,occ_time,place_id,genre_id,res_id,level_id,content,copingが揃っていれば看護師承認(check_id = 2)として保存できる" do
        @report.check_id = 2
        @report.desc_date = nil
        @report.desc_user = nil
        @report.desc_content = nil
        @report.count_content = nil
        expect(@report).to be_valid
      end
      it "client_id,user_id,occ_time,place_id,genre_id,res_id,level_id,content,count_contentが揃っていれば現場責任者承認(check_id = 3)として保存できる" do
        @report.check_id = 3
        @report.desc_date = nil
        @report.desc_user = nil
        @report.desc_content = nil
        expect(@report).to be_valid
      end
      it "client_id,user_id,occ_time,place_id,genre_id,res_id,level_id,content,count_content,desc_date,desc_user,desc_contentが揃っていればケアマネージャー承認として保存できる" do
        @report.check_id = 4
        expect(@report).to be_valid
      end
      it "client_id,user_id,occ_time,place_id,genre_id,res_id,level_id,content,count_content,desc_date,desc_user,desc_contentが揃っていれば施設責任者承認として保存できる" do
        @report.check_id = 5
        expect(@report).to be_valid
      end
      it "pictureは空でも保存できる" do
        @report.picture = nil
        expect(@report).to be_valid
      end
      it "hospitalは空でも保存できる" do
        @report.hospital = nil
        expect(@report).to be_valid
      end
    end

    context "事故報告書の保存ができないとき" do
      it "client_idが空だと保存できない" do
        @report.client_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("お客様名を入力してください")        
      end
      it "user_idが空だと保存できない" do
        @report.user_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("ユーザーIDが入力されていません。")        
      end
      it "occ_timeが空だと保存できない" do
        @report.occ_time = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の発生時刻が入力されていません。") 
      end
      it "place_idが空だと保存できない" do
        @report.place_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の発生場所が入力されていません。")        
      end
      it "genre_idが空だと保存できない" do
        @report.genre_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の種別が入力されていません。")
      end
      it "res_idが空だと保存できない" do
        @report.res_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の状況が入力されていません。")        
      end
      it "level_idが空だと保存できない" do
        @report.level_id = nil
        @report.valid?
        expect(@report.errors.full_messages).to include("受傷の程度が入力されていません。")        
      end
      it "place_idが1だと保存できない" do
        @report.place_id = 1
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の発生場所が選択されていません。")        
      end
      it "gemre_idが0だと保存できない" do
        @report.genre_id = 0
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の種別が選択されていません。")        
      end
      it "res_idが1だと保存できない" do
        @report.res_id = 1
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の状況が選択されていません。")        
      end
      it "level_idが1だと保存できない" do
        @report.level_id = 1
        @report.valid?
        expect(@report.errors.full_messages).to include("受傷の程度が選択されていません。")        
      end
      it "check_idが1のとき、contentが空だと保存できない" do
        @report.check_id = 1
        @report.content = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の内容は本人承認に必要な項目です。")        
      end
      it "check_idが1のとき、copingが空だと保存できない" do
        @report.check_id = 1
        @report.coping = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("対処の詳細は本人承認に必要な項目です。")        
      end
      it "check_idが2のとき、contentが空だと保存できない" do
        @report.check_id = 2
        @report.content = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の内容は本人承認時に必要な項目です。")        
      end
      it "check_idが2のとき、copingが空だと保存できない" do
        @report.check_id = 2
        @report.coping = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("対処の詳細は本人承認時に必要な項目です。")        
      end
      it "check_idが3のとき、contentが空だと保存できない" do
        @report.check_id = 3
        @report.content = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の内容は本人承認時に必要な項目です。")        
      end
      it "check_idが3のとき、copingが空だと保存できない" do
        @report.check_id = 3
        @report.coping = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("対処の詳細は本人承認時に必要な項目です。")        
      end
      it "check_idが3のとき、count_contentが空だと保存できない" do
        @report.check_id = 3
        @report.count_content = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("再発防止策の内容は現場責任者承認に必要な項目です")        
      end
      it "check_idが4のとき、contentが空だと保存できない" do
        @report.check_id = 4
        @report.content = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("事故の内容は本人承認時に必要な項目です。")        
      end
      it "check_idが4のとき、copingが空だと保存できない" do
        @report.check_id = 4
        @report.coping = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("対処の詳細は本人承認時に必要な項目です。")        
      end
      it "check_idが4のとき、desc_contentが空だと保存できない" do
        @report.check_id = 4
        @report.desc_content = ""
        @report.valid?
        expect(@report.errors.full_messages).to include("家族への説明内容はケアマネージャー承認に必要な項目です")        
      end
      it "desc_dateが未来の日付だった場合は保存できない" do
        @report.check_id = 4
        @report.desc_date = Date.tomorrow
        @report.valid?
        expect(@report.errors.full_messages).to include("家族への報告日は未来の日時を設定することはできません")        
      end
    end
  
  end
end
