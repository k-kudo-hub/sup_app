require 'rails_helper'

RSpec.describe Nutrition, type: :model do
  before do
    @nutrition = FactoryBot.build(:nutrition)
  end

  # bundle exec rspec spec/models/nnutrition_spec.rb

  describe '記録の保存' do
    context '記録の保存がうまくいくとき' do
      it 'date,six_water_amount,morning_meal_m_id,morning_meal_s_id,morning_water_amount,ten_water_amount,lunch_meal_m_id,lunch_meal_s_id,lunch_water_amount,fifty_water_amount,dinner_meal_m_id,dinner_meal_s_id,dinner_water_amount,twenty_water_amountが揃っていれば保存できる' do
        expect(@nutrition).to be_valid
      end
    end

    context '記録の保存がうまくいかないとき' do
      it 'client_idが空だと保存できない' do
        @nutrition.client_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('Clientを入力してください')
      end
      it 'user_idが空だと保存できない' do
        @nutrition.user_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('ユーザーIDが入力されていません。')
      end
      it 'dateが空だと保存できない' do
        @nutrition.date = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('日付が入力されていません。')
      end
      it 'six_water_amountが空だと保存できない' do
        @nutrition.six_water_amount = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('6時の水分量が入力されていません。')
      end
      it 'morning_meal_m_idが空だと保存できない' do
        @nutrition.morning_meal_m_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('朝食（主食）食事量が入力されていません。')
      end
      it 'morning_meal_s_idが空だと保存できない' do
        @nutrition.morning_meal_s_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('朝食（副食）食事量が入力されていません。')
      end
      it 'morning_water_amountが空だと保存できない' do
        @nutrition.morning_water_amount = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('朝食の水分量が入力されていません。')
      end
      it 'ten_water_amountが空だと保存できない' do
        @nutrition.ten_water_amount = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('10時の水分量が入力されていません。')
      end
      it 'lunch_meal_m_idが空だと保存できない' do
        @nutrition.lunch_meal_m_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('昼食（主食）食事量が入力されていません。')
      end
      it 'lunch_meal_s_idが空だと保存できない' do
        @nutrition.lunch_meal_s_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('昼食（副食）食事量が入力されていません。')
      end
      it 'lunch_water_amountが空だと保存できない' do
        @nutrition.lunch_water_amount = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('昼食の水分量が入力されていません。')
      end
      it 'fifty_water_amountが空だと保存できない' do
        @nutrition.fifty_water_amount = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('15時の水分量が入力されていません。')
      end
      it 'dinner_meal_m_idが空だと保存できない' do
        @nutrition.dinner_meal_m_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('夕食（主食）食事量が入力されていません。')
      end
      it 'dinner_meal_s_idが空だと保存できない' do
        @nutrition.dinner_meal_s_id = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('夕食（副食）食事量が入力されていません。')
      end
      it 'dinner_water_amountが空だと保存できない' do
        @nutrition.dinner_water_amount = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('夕食の水分量が入力されていません。')
      end
      it 'twenty_water_amountが空だと保存できない' do
        @nutrition.twenty_water_amount = ''
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('20時の水分量が入力されていません。')
      end
      it 'six_water_amountが数字以外だと保存できない' do
        @nutrition.six_water_amount = '二百'
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('6時の水分量は数字で入力してください。')
      end
      it 'morning_water_amountが数字以外だと保存できない' do
        @nutrition.morning_water_amount = '二百'
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('朝食の水分量は数字で入力してください。')
      end
      it 'ten_water_amountが数字以外だと保存できない' do
        @nutrition.ten_water_amount = '二百'
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('10時の水分量は数字で入力してください。')
      end
      it 'lunch_water_amountが数字以外だと保存できない' do
        @nutrition.lunch_water_amount = '二百'
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('昼食の水分量は数字で入力してください。')
      end
      it 'fifty_water_amountが数字以外だと保存できない' do
        @nutrition.fifty_water_amount = '二百'
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('15時の水分量は数字で入力してください。')
      end
      it 'dinner_water_amountが数字以外だと保存できない' do
        @nutrition.dinner_water_amount = '二百'
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('夕食の水分量は数字で入力してください。')
      end
      it 'twenty_water_amountが数字以外だと保存できない' do
        @nutrition.twenty_water_amount = '二百'
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('20時の水分量は数字で入力してください。')
      end
      it 'morning_meal_m_idが0だと保存できない' do
        @nutrition.morning_meal_m_id = 0
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('朝食（主食）食事量が選択されていません')
      end
      it 'morning_meal_s_idが0だと保存できない' do
        @nutrition.morning_meal_s_id = 0
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('朝食（副食）食事量が選択されていません')
      end
      it 'lunch_meal_m_idが0だと保存できない' do
        @nutrition.lunch_meal_m_id = 0
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('昼食（主食）食事量が選択されていません')
      end
      it 'lunch_meal_s_idが0だと保存できない' do
        @nutrition.lunch_meal_s_id = 0
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('昼食（副食）食事量が選択されていません')
      end
      it 'dinner_meal_m_idが0だと保存できない' do
        @nutrition.dinner_meal_m_id = 0
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('夕食（主食）食事量が選択されていません')
      end
      it 'dinner_meal_s_idが0だと保存できない' do
        @nutrition.dinner_meal_s_id = 0
        @nutrition.valid?
        expect(@nutrition.errors.full_messages).to include('夕食（副食）食事量が選択されていません')
      end
    end
  end
end
