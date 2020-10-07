class Record < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :major
    belongs_to_active_hash :main
    belongs_to_active_hash :sub
    belongs_to_active_hash :carry
    belongs_to_active_hash :shape
    belongs_to_active_hash :amount
    belongs_to_active_hash :meal

  belongs_to :client

  with_options presence: {nessage: "が入力されていません。"} do
    validates :client_id
    validates :major_item_id,  numericality:{ other_than: 1 , message: "が選択されていません。"}
    validates :main_item_id,   numericality:{ other_than: 1 , message: "が選択されていません。"}
    validates :sub_item_id,    numericality:{ other_than: 1 , message: "が選択されていません。"}
    validates :start_time
    validates :end_time
  end
  
  validates :water_amount, :urine_amount, numericality: { only_integer: true, message: "は数字で入力してください。" }
  validates :water_amount, :urine_amount, format: {with: /\A[0-9]+\z/, message: "は半角数字のみ使用できます。"}
  validate :time_check

  def time_check
    if (carryout_id == 2) && (start_time > Time.now)
      errors.add(:start_time, "未来の記録はできません")
    elsif (carryout_id == 2) && (end_time > Time.now)
      errors.add(:end_time, "未来の記録はできません")
    end
  end
end
