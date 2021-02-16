class Client < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :sex

  has_one :detail, dependent: :destroy
  has_one :caregiver, dependent: :destroy
  has_one :room, dependent: :destroy
  has_many :relationships
  has_many :users, through: :relationships
  has_many :records
  has_many :reports
  has_many :nutritions

  mount_uploader :picture, PictureUploader

  with_options presence: { message: 'が入力されていません。' } do
    validates :name
    validates :name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナのみ登録できます。' }
    validates :birth
    validates :room_number, format: { with: /\A[0-9]+\z/, message: 'は数字のみ登録できます。' }
    validates :sex_id, numericality: { other_than: 1, message: 'が選択されていません。' }
  end
  validates :status_id, numericality: { other_than: 1, message: 'が選択されていません。' }

  def no_image?
    self.picture.file.nil?
  end

  def room_present?
    self.room.present?
  end

  def important_in_days?(days)
    self.room.messages.where(created_at: days).where(tag_id: 3).exists?
  end

  def caution_in_days?(days)
    self.room.messages.where(created_at: days).where(tag_id: 2).exists?
  end

  def message_exists?
    self.room.messages.exists?
  end

  def latest_message
    self.room.messages.last.content
  end

  def latest_message_time
    self.room.messages.last.created_at
  end

  def todays_record(day)
    self.records.where(start_time: day).order("start_time ASC")
  end

  def today_nutritions
    self.nutritions.find_by(date: Date.today)
  end

  def sum_water_amount
    today_nutritions.six_water_amount + 
    today_nutritions.morning_water_amount +
    today_nutritions.ten_water_amount +
    today_nutritions.lunch_water_amount +
    today_nutritions.fifty_water_amount +
    today_nutritions.dinner_water_amount +
    today_nutritions.twenty_water_amount
  end

  def morning_main_meal
    Meal.find_by(id: self.nutritions.find_by(date: Date.today).morning_meal_m_id).name
  end

  def morning_sub_meal
    Meal.find_by(id: self.nutritions.find_by(date: Date.today).morning_meal_s_id).name 
  end

  def lunch_main_meal
    Meal.find_by(id: self.nutritions.find_by(date: Date.today).lunch_meal_m_id).name
  end

  def lunch_sub_meal
    Meal.find_by(id: self.nutritions.find_by(date: Date.today).lunch_meal_s_id).name 
  end

  def dinner_main_meal
    Meal.find_by(id: self.nutritions.find_by(date: Date.today).dinner_meal_m_id).name
  end

  def dinner_sub_meal
    Meal.find_by(id: self.nutritions.find_by(date: Date.today).dinner_meal_s_id).name 
  end

end
